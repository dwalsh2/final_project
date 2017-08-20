class DeleteColumnsFromRoutes < ActiveRecord::Migration[5.1]
  def change
    
    add_column :routes, :title, :string
    
    remove_column :routes, :starting_latitude
    
    remove_column :routes, :starting_longitude
    
    remove_column :routes, :ending_latitude
    
    remove_column :routes, :ending_longitude
    
  end
end
