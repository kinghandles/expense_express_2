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

  # Indirect associations

  has_many   :categories,
             :through => :expenses,
             :source => :category

  # Validations

end
