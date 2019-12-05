class AddStuffToExpenses < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :date, :date
    add_column :expenses, :name, :string
  end
end
