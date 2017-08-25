class DeleteWaypointIdFromBusinesses < ActiveRecord::Migration[5.1]
  def change
    
    remove_column :businesses, :waypoint_id
    
  end
end
