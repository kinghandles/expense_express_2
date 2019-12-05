class Category < ApplicationRecord
  # Direct associations

  has_many   :expenses,
             :dependent => :nullify

  # Indirect associations

  has_many   :groups,
             :through => :expenses,
             :source => :group

  # Validations

end
