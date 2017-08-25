# == Schema Information
#
# Table name: waypoints
#
#  id         :integer          not null, primary key
#  latitude   :string
#  longitude  :string
#  route_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Waypoint < ApplicationRecord
    
    belongs_to :route
    
    has_many :bookmarks, :dependent => :destroy 
    
    has_many :businesses, :through => :bookmarks, :source => :business 
    
    validates :latitude, :presence => true
    
    validates :longitude, :presence => true
    
    validates :route_id, :presence => true

end
