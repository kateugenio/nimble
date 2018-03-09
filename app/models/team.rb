class Team < ApplicationRecord
  belongs_to :company
  validates :name, presence: true, uniqueness: true
end
