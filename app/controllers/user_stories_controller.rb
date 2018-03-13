class UserStoriesController < ApplicationController

	def create
		@team = Team.find(params[:team_id])
		@user_story = @team.user_stories.create(user_story_params)
		if @user_story.save
			redirect_to team_path(@team)
		else
			flash[:alert] = "Please enter a user story title"
			redirect_to team_path(@team)
		end
	end

	private

	def user_story_params
		params.require(:user_story).permit(:title, :description, :acceptance_criteria, :estimate, :state, :priority, :order_id)
	end

end
