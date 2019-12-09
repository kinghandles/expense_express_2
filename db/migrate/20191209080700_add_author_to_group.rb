class AddAuthorToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :created_by, :string
  end
end
