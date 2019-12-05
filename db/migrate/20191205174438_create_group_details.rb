class CreateGroupDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :group_details do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
