class TeamsController < ApplicationController
  before_action :authenticate_user!

  def show
    @team = Team.find(params[:id])
    @all_user_stories = @team.user_stories.all.order('order_id ASC')
    if current_user.company != @team.company
      flash[:alert] = "You don't have access to this page!"
      redirect_to root_path
    end
  end

  def create
  	# @company = current_user.company
  	@team = current_user.company.teams.create(team_params)
  	if @team.save
  		redirect_to root_path
  	else
  		flash[:alert] = "Please enter a Team name"
  		redirect_to root_path
  	end
  end

  private

  def team_params
  	params.require(:team).permit(:name, :description)
  end
end
