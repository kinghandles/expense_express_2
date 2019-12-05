class Group < ApplicationRecord
  # Direct associations

  has_many   :expenses,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
