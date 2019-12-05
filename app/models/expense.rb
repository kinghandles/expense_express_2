class Expense < ApplicationRecord
  # Direct associations

  belongs_to :group

  has_many   :individual_expense_ledgers,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :group_id, :uniqueness => true

  validates :group_id, :presence => true

end
