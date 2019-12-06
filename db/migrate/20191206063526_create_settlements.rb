class CreateSettlements < ActiveRecord::Migration[5.1]
  def change
    create_table :settlements do |t|
      t.integer :user_id
      t.integer :expense_id
      t.float :to_receive
      t.float :to_pay
      t.string :username

      t.timestamps
    end
  end
end
