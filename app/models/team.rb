class Team < ApplicationRecord
  belongs_to :company
  has_many :user_stories, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
