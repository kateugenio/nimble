class Company < ApplicationRecord
	has_many :users, dependent: :destroy
	has_many :teams, dependent: :destroy
	has_many :user_stories, through: :teams
end
