class AddYelpToBusinesses < ActiveRecord::Migration[5.1]
  def change
    
    add_column :businesses, :yelp, :string

  end
end
