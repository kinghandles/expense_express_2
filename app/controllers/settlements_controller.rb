class SettlementsController < ApplicationController
  def index
    @settlements = Settlement.all

    render("settlement_templates/index.html.erb")
  end

  def show
    @settlement = Settlement.find(params.fetch("id_to_display"))

    render("settlement_templates/show.html.erb")
  end

  def new_form
    @settlement = Settlement.new

    render("settlement_templates/new_form.html.erb")
  end

  def create_row
    @settlement = Settlement.new

    @settlement.user_id = params.fetch("user_id")
    @settlement.expense_id = params.fetch("expense_id")
    @settlement.to_receive = params.fetch("to_receive")
    @settlement.to_pay = params.fetch("to_pay")
    @settlement.username = params.fetch("username",nil)

    if @settlement.valid?
      @settlement.save

      redirect_back(:fallback_location => "/settlements", :notice => "Settlement created successfully.")
    else
      render("settlement_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @settlement = Settlement.find(params.fetch("prefill_with_id"))

    render("settlement_templates/edit_form.html.erb")
  end

  def update_row
    @settlement = Settlement.find(params.fetch("id_to_modify"))

    @settlement.user_id = params.fetch("user_id")
    @settlement.expense_id = params.fetch("expense_id")
    @settlement.to_receive = params.fetch("to_receive")
    @settlement.to_pay = params.fetch("to_pay")
    @settlement.username = params.fetch("username", nil)

    if @settlement.valid?
      @settlement.save

      redirect_to("/expenses/#{@settlement.expense_id}", :notice => "Settlement updated successfully.")
    else
      render("settlement_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @settlement = Settlement.find(params.fetch("id_to_remove"))

    @settlement.destroy

    redirect_to("/settlements", :notice => "Settlement deleted successfully.")
  end
end
