class AddColumnsToGroupDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :group_details, :username, :string
    add_column :group_details, :group_name, :string
  end
end
