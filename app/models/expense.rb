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

  # Methods
  
  def fair_share
    fair_share = (self.amount / self.users.count).round(2)
    return fair_share
  end

  def to_send
    return (self.amount / self.users.count).round(2)
  end

  def to_receive
    return (self.amount - self.amount / self.users.count).round(2)
  end


end
