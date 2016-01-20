class AddContainersNeededToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :containers_needed, :integer
  end
end
