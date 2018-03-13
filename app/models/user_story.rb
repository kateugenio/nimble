class UserStory < ApplicationRecord
  belongs_to :team
  validates :title, presence: :true

  after_create :set_order_id, :set_priority_and_state

  def set_order_id
  	last_us = UserStory.order("id DESC").offset(1).first
  	if UserStory.where(order_id: '1').exists?
  		self.order_id = last_us.order_id += 1
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
