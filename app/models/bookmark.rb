# == Schema Information
#
# Table name: bookmarks
#
#  id           :integer          not null, primary key
#  waypoint_id  :integer
#  business_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  search_topic :string
#  user_id      :integer
#

class Bookmark < ApplicationRecord
    
    belongs_to :business
    
    belongs_to :waypoint 
    
    belongs_to :user 
    
    validates :waypoint_id, :presence => true
    
    validates :business_id, :presence => true
    
     
end
