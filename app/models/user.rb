class User < ApplicationRecord

    # Direct associations

  has_many   :individual_expense_ledgers,
             :dependent => :destroy

  has_many :group_details, :dependent => :destroy

  # Indirect associations

  has_many   :expenses,
             :through => :individual_expense_ledgers,
             :source => :expense

  has_many :groups, :through => :group_details, :source => :group

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :presence => true
  validates :username, :uniqueness => true    
  
end
