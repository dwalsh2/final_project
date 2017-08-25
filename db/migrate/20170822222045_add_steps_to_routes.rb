class AddStepsToRoutes < ActiveRecord::Migration[5.1]
  def change
    
    add_column :routes, :steps, :string
    
  end
end
