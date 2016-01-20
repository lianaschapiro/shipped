class ChangeCostColumnOnJobsTable < ActiveRecord::Migration
  def change
  	change_column :jobs, :cost, :decimal
  end
end
