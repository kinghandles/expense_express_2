class Category < ApplicationRecord
  # Direct associations

  has_many   :expenses,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
