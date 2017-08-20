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
#

class Bookmark < ApplicationRecord
    
    belongs_to :business
    
    belongs_to :waypoint 
     
end
