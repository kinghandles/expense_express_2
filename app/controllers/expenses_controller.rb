class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all

    render("expense_templates/index.html.erb")
  end

  def show
    @individual_expense_ledger = IndividualExpenseLedger.new
    @expense = Expense.find(params.fetch("id_to_display"))

    render("expense_templates/show.html.erb")
  end

  def new_form
    @expense = Expense.new

    render("expense_templates/new_form.html.erb")
  end

  def create_row
    @expense = Expense.new

    @expense.group_id = params.fetch("group_id")
    @expense.category_id = params.fetch("category_id")
    @expense.amount = params.fetch("amount")
    @expense.description = params.fetch("description")

    if @expense.valid?
      @expense.save

      redirect_back(:fallback_location => "/expenses", :notice => "Expense created successfully.")
    else
      render("expense_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_group
    @expense = Expense.new

    @expense.group_id = params.fetch("group_id")
    @expense.category_id = params.fetch("category_id")
    @expense.amount = params.fetch("amount")
    @expense.description = params.fetch("description")

    if @expense.valid?
      @expense.save

      redirect_to("/groups/#{@expense.group_id}", notice: "Expense created successfully.")
    else
      render("expense_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_category
    @expense = Expense.new

    @expense.group_id = params.fetch("group_id")
    @expense.category_id = params.fetch("category_id")
    @expense.amount = params.fetch("amount")
    @expense.description = params.fetch("description")

    if @expense.valid?
      @expense.save

      redirect_to("/categories/#{@expense.category_id}", notice: "Expense created successfully.")
    else
      render("expense_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @expense = Expense.find(params.fetch("prefill_with_id"))

    render("expense_templates/edit_form.html.erb")
  end

  def update_row
    @expense = Expense.find(params.fetch("id_to_modify"))

    @expense.group_id = params.fetch("group_id")
    @expense.category_id = params.fetch("category_id")
    @expense.amount = params.fetch("amount")
    @expense.description = params.fetch("description")

    if @expense.valid?
      @expense.save

      redirect_to("/expenses/#{@expense.id}", :notice => "Expense updated successfully.")
    else
      render("expense_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_group
    @expense = Expense.find(params.fetch("id_to_remove"))

    @expense.destroy

    redirect_to("/groups/#{@expense.group_id}", notice: "Expense deleted successfully.")
  end

  def destroy_row_from_category
    @expense = Expense.find(params.fetch("id_to_remove"))

    @expense.destroy

    redirect_to("/categories/#{@expense.category_id}", notice: "Expense deleted successfully.")
  end

  def destroy_row
    @expense = Expense.find(params.fetch("id_to_remove"))

    @expense.destroy

    redirect_to("/expenses", :notice => "Expense deleted successfully.")
  end
end
