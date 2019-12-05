class IndividualExpenseLedger < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :expense_id, :uniqueness => true

  validates :expense_id, :presence => true

  validates :user_id, :uniqueness => true

  validates :user_id, :presence => true

end
