class CreateSearchTopicInBookmarks < ActiveRecord::Migration[5.1]
  def change
    
    add_column :bookmarks, :search_topic, :string
    
  end
end
