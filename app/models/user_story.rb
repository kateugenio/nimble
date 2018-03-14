class UserStory < ApplicationRecord
  belongs_to :team
  validates :title, presence: :true

  before_create :set_order_id, :set_priority_and_state

  def set_order_id
  	# last_us = UserStory.order("id DESC").offset(1).first
    if UserStory.where(team_id: self.team_id).exists? && UserStory.where(order_id: '1')
      team = UserStory.where(team_id: self.team_id).last
      self.order_id = team.order_id += 1
    else
      self.order_id = 1
    end
  end

  def set_priority_and_state
  	self.priority = 'High'
  	self.state = 'New'
  end

  PRIORITIES = [
  	'High',
  	'Medium',
  	'Low'
  ]

  STATES = [
  	'New',
  	'In Progress',
  	'Accepted'
  ]
end
