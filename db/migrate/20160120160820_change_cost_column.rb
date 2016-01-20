class ChangeCostColumn < ActiveRecord::Migration
  def change
  	change_column :jobs, :cost, :decimal, :precision => 9, :scale => 2
  end
end
