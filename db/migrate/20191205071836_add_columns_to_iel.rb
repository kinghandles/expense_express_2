class AddColumnsToIel < ActiveRecord::Migration[5.1]
  def change
    add_column :individual_expense_ledgers, :group_id, :integer
  end
end
