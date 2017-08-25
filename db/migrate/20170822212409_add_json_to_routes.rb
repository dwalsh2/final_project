class AddJsonToRoutes < ActiveRecord::Migration[5.1]
  def change
    
        add_column :routes, :parsed_maps_data, :string

  end
end
