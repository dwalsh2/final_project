class ChangeTitleToName < ActiveRecord::Migration[5.1]
  def change
    
    rename_column :routes, :title, :name
    
  end
end
