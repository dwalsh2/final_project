class DeleteBusinessIdOnWaypoint < ActiveRecord::Migration[5.1]
  def change
    
    remove_column :waypoints, :business_id
    
  end
end
