class Group < ApplicationRecord

  def total_exp
    total = 0
    self.expenses.each do |expense|
        total = total + expense.amount
    end
    return total 
  end

    # Direct associations

  has_many   :expenses,
             :dependent => :destroy

  has_many :individual_expense_ledgers, :dependent => :destroy

  has_many :group_details, :dependent => :destroy

  # Indirect associations

  has_many   :categories,
             :through => :expenses,
             :source => :category

  has_many :users, :through => :group_details, :source => :user

  # Validations
    validates :created_by, :presence => true
    validates :created_by, :uniqueness => true
end
