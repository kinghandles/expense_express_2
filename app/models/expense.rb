class Expense < ApplicationRecord
  # Direct associations

  belongs_to :category,
             :required => false

  belongs_to :group

  has_many   :individual_expense_ledgers,
             :dependent => :destroy

  has_many :settlements, :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :individual_expense_ledgers,
             :source => :user

  # Validations

  validates :paid_by, :presence => true
  validates :group_id, :presence => true
  validates :group_id, :uniqueness => true

end
