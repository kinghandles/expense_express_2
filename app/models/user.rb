class User < ApplicationRecord
  # Direct associations

  has_many   :individual_expense_ledgers,
             :dependent => :destroy

  # Indirect associations

  has_many   :expenses,
             :through => :individual_expense_ledgers,
             :source => :expense

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
