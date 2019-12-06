class AddPaidByToExpenses < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :paid_by, :string
  end
end
