class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.integer :group_id
      t.integer :category_id
      t.float :amount
      t.text :description

      t.timestamps
    end
  end
end
