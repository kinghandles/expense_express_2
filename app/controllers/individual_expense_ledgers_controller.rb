class IndividualExpenseLedgersController < ApplicationController
  before_action :current_user_must_be_individual_expense_ledger_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_individual_expense_ledger_user
    individual_expense_ledger = IndividualExpenseLedger.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == individual_expense_ledger.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.individual_expense_ledgers.ransack(params[:q])
    @individual_expense_ledgers = @q.result(:distinct => true).includes(:user, :expense).page(params[:page]).per(10)

    render("individual_expense_ledger_templates/index.html.erb")
  end

  def show
    @individual_expense_ledger = IndividualExpenseLedger.find(params.fetch("id_to_display"))

    render("individual_expense_ledger_templates/show.html.erb")
  end

  def new_form
    @individual_expense_ledger = IndividualExpenseLedger.new

    render("individual_expense_ledger_templates/new_form.html.erb")
  end

  def create_row
    @individual_expense_ledger = IndividualExpenseLedger.new

    @individual_expense_ledger.expense_id = params.fetch("expense_id")
    @individual_expense_ledger.user_id = params.fetch("user_id")
    @individual_expense_ledger.notes = params.fetch("notes",nil)
    @individual_expense_ledger.group_id = params.fetch("group_id",nil)    

    if @individual_expense_ledger.valid?
      @individual_expense_ledger.save

      redirect_back(:fallback_location => "/individual_expense_ledgers", :notice => "Individual expense ledger created successfully.")
    else
      render("individual_expense_ledger_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_expense
    @individual_expense_ledger = IndividualExpenseLedger.new

    @individual_expense_ledger.expense_id = params.fetch("expense_id")
    @individual_expense_ledger.user_id = params.fetch("user_id")
    @individual_expense_ledger.notes = params.fetch("notes",nil)
    @individual_expense_ledger.group_id = params.fetch("group_id")

    if @individual_expense_ledger.valid?
      @individual_expense_ledger.save

      redirect_to("/expenses/#{@individual_expense_ledger.expense_id}", notice: "IndividualExpenseLedger created successfully.")
    else
      render("individual_expense_ledger_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @individual_expense_ledger = IndividualExpenseLedger.find(params.fetch("prefill_with_id"))

    render("individual_expense_ledger_templates/edit_form.html.erb")
  end

  def update_row
    @individual_expense_ledger = IndividualExpenseLedger.find(params.fetch("id_to_modify"))

    @individual_expense_ledger.expense_id = params.fetch("expense_id")
    
    @individual_expense_ledger.notes = params.fetch("notes")

    @individual_expense_ledger.group_id = params.fetch("group_id",nil)

    if @individual_expense_ledger.valid?
      @individual_expense_ledger.save

      redirect_to("/individual_expense_ledgers/#{@individual_expense_ledger.id}", :notice => "Individual expense ledger updated successfully.")
    else
      render("individual_expense_ledger_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @individual_expense_ledger = IndividualExpenseLedger.find(params.fetch("id_to_remove"))

    @individual_expense_ledger.destroy

    redirect_to("/users/#{@individual_expense_ledger.user_id}", notice: "IndividualExpenseLedger deleted successfully.")
  end

  def destroy_row_from_expense
    @individual_expense_ledger = IndividualExpenseLedger.find(params.fetch("id_to_remove"))

    @individual_expense_ledger.destroy

    redirect_to("/expenses/#{@individual_expense_ledger.expense_id}", notice: "IndividualExpenseLedger deleted successfully.")
  end

  def destroy_row
    @individual_expense_ledger = IndividualExpenseLedger.find(params.fetch("id_to_remove"))

    @individual_expense_ledger.destroy

    redirect_to("/individual_expense_ledgers", :notice => "Individual expense ledger deleted successfully.")
  end
end
