class Expense < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :group_id, :uniqueness => true

  validates :group_id, :presence => true

end
