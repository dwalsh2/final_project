class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.integer :waypoint_id
      t.integer :business_id

      t.timestamps

    end
  end
end
