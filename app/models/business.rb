# == Schema Information
#
# Table name: businesses
#
#  id              :integer          not null, primary key
#  waypoint_id     :integer
#  name            :string
#  image_url       :string
#  url             :string
#  phone           :string
#  rating          :string
#  location        :string
#  yelp_api_return :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  yelp            :string
#

class Business < ApplicationRecord
    
    has_many :bookmarks, :dependent => :destroy 
    
    has_many :waypoints, :through => :bookmarks, :source => :waypoint 
    
    validates :name, :presence => true
    
end
