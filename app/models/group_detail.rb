class GroupDetail < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :group

   # Validations

  validates :user_id, :presence => true
  validates :group_id, :presence => true
  validates :user_id, uniqueness: {scope: :group_id}
  validates :username, :presence => true



end
