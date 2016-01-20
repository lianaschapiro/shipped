class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
    @job = Job.new
  end

  def new
    @boat = Boat.new
  end

  def create
    @user = current_user
    @boat = current_user.boats.build(boat_params)
    if @boat.save
      flash[:notice] = "Shipment created"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Unable to create shipment"
      render 'users/show'
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    @boat.save
    flash[:notice] = "Shipment details changed"
    redirect_to user_path(current_user)
  end

  def destroy
    @boat = Boat.find(params[:id])
    if @boat.destroy
      flash[:notice] = "Boat deleted"
    else
      flash[:notice] = "Unable to delete boat"
    end
    redirect_to user_path(current_user)
  end

   private
    def boat_params
      params.require(:boat).permit(:name, :location, :containermax)
    end
end
