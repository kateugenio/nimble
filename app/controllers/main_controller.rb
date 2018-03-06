class MainController < ApplicationController
  def index
  	puts current_user.email 
  end
end
