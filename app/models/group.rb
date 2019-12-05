class Group < ApplicationRecord
  # Direct associations

  has_many   :expenses,
             :dependent => :destroy

  # Indirect associations

  has_many   :categories,
             :through => :expenses,
             :source => :category

  # Validations

end
