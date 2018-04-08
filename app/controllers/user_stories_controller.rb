class UserStoriesController < ApplicationController

	before_action :validate_user, only: [:show]

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

	def show
		@team = Team.find(params[:team_id])
		@user_story = @team.user_stories.find(params[:id])
	end

	def update
		@team = Team.find(params[:team_id])
		@user_story = UserStory.find(params[:id])
		if @user_story.update(user_story_params)
			redirect_to team_path(@team)
		else
			render 'user_stories/show'
		end
	end

	def destroy
		@team = Team.find(params[:team_id])
		@user_story = @team.user_stories.find(params[:id])
		@user_story.destroy
		redirect_to team_path(@team)
	end

	private

	def user_story_params
		params.require(:user_story).permit(:title, :description, :acceptance_criteria, :estimate, :state, :priority, :order_id)
	end

	def validate_user
		@team = Team.find(params[:team_id])
		if current_user.company != @team.company
	    	flash[:alert] = "You don't have access to this page!"
	      	redirect_to root_path
	    end
	end

end
