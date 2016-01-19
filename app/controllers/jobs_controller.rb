class JobsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
		@boat = Boat.find(params[:boat_id])
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
