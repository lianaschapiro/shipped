class JobsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
		@boat = Boat.find(params[:boat_id])
  		@job = @boat.jobs.build(job_params)
  		@job.user = current_user
  		if @job.save
  			redirect_to boat_path(@boat)
  		else
  			render "boats/show"
  		end
	end

	def edit
  		@boat = Boat.find(params[:boat_id])
  		@job = Job.find(params[:id])
	end

	def update
		@boat = Boat.find(params[:boat_id])
	  	@job = Job.find(params[:id])
		@job.update(job_params)
		@job.save
		flash[:notice] = "Thanks for editing"
		redirect_to boat_path(@boat)
	end

	def destroy
		@boat = Boat.find(params[:boat_id])
		@job = Job.find(params[:id])
		if @job.destroy
			flash[:notice] = "Job cancelled"
		else
			flash[:notice] = "Unable to cancel job"		
		end
		redirect_to boat_path(@boat)
	end

	private
    def job_params
      params.require(:job).permit(:name, :description, :cost, :origin, :destination)
    end

end
