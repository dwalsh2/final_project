class AddOriginAndDestinationToRoutes < ActiveRecord::Migration[5.1]
  def change
    
    add_column :routes, :origin, :string
    
    add_column :routes, :destination, :string
    
    add_column :routes, :map, :string
    
  end
end
