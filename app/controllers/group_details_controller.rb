class GroupDetailsController < ApplicationController
  def index
    @group_details = GroupDetail.all

    render("group_detail_templates/index.html.erb")
  end

  def show
    @group_detail = GroupDetail.find(params.fetch("id_to_display"))

    render("group_detail_templates/show.html.erb")
  end

  def new_form
    @group_detail = GroupDetail.new

    render("group_detail_templates/new_form.html.erb")
  end

  def create_row
    @group_detail = GroupDetail.new

    @group_detail.user_id = params.fetch("user_id")
    @group_detail.group_id = params.fetch("group_id")

    if @group_detail.valid?
      @group_detail.save

      redirect_back(:fallback_location => "/group_details", :notice => "Group detail created successfully.")
    else
      render("group_detail_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @group_detail = GroupDetail.find(params.fetch("prefill_with_id"))

    render("group_detail_templates/edit_form.html.erb")
  end

  def update_row
    @group_detail = GroupDetail.find(params.fetch("id_to_modify"))

    @group_detail.user_id = params.fetch("user_id")
    @group_detail.group_id = params.fetch("group_id")

    if @group_detail.valid?
      @group_detail.save

      redirect_to("/group_details/#{@group_detail.id}", :notice => "Group detail updated successfully.")
    else
      render("group_detail_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @group_detail = GroupDetail.find(params.fetch("id_to_remove"))

    @group_detail.destroy

    redirect_to("/group_details", :notice => "Group detail deleted successfully.")
  end

  def destroy_row_from_group
    @group_detail = GroupDetail.find(params.fetch("id_to_remove"))

    @group_detail.destroy

    redirect_to("/group_details", :notice => "Group detail deleted successfully.")
  end

end
