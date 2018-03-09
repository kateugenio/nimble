class TeamsController < ApplicationController
  def backlog
  end

  def create
  	@company = current_user.company
  	@team = @company.teams.create(team_params)
  	if @team.save
  		redirect_to root_path
  	else
  		flash.now[:alert] = 'wrong!'
      puts @team.errors.full_messages
  		redirect_to root_path
  	end
  end

  private

  def team_params
  	params.require(:team).permit(:name, :description)
  end
end
