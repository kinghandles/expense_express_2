class CreateIndividualExpenseLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :individual_expense_ledgers do |t|
      t.integer :expense_id
      t.integer :user_id
      t.text :notes

      t.timestamps
    end
  end
end
