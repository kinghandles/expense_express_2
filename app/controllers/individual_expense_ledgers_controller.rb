class IndividualExpenseLedgersController < ApplicationController
  def index
    @individual_expense_ledgers = IndividualExpenseLedger.all

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
    @individual_expense_ledger.notes = params.fetch("notes")

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
    @individual_expense_ledger.notes = params.fetch("notes")

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
    @individual_expense_ledger.user_id = params.fetch("user_id")
    @individual_expense_ledger.notes = params.fetch("notes")

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
