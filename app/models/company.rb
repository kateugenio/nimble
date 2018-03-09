class Company < ApplicationRecord
	has_many :users, dependent: :destroy
	has_many :teams, dependent: :destroy
end
