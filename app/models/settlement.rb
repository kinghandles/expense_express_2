class Settlement < ApplicationRecord
    belongs_to :user
    belongs_to :expense

    validates :user_id, :presence => true
    validates :expense_id, :presence => true


end
