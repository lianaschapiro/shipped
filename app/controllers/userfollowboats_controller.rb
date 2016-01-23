class UserfollowboatsController < ApplicationController
  
  def create
  	@boat = Boat.find(params[:boat_id])
	current_user.userfollowboats.create(user_id: current_user.id, boat_id: @boat.id)
	redirect_to :back
  end

  def destroy
  	@boat = Boat.find(params[:boat_id])
  	current_user.userfollowboats.find_by(boat_id: params[:boat_id]).delete
  	redirect_to :back
  end
end
