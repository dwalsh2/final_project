# == Schema Information
#
# Table name: routes
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  origin           :string
#  destination      :string
#  map              :string
#  name             :string
#  parsed_maps_data :string
#  steps            :string
#

class Route < ApplicationRecord
    
    belongs_to :user

    has_many :waypoints, :dependent => :destroy 
    
    validates :user_id, :presence => true
    
    validates :origin, :presence => true
    
    validates :destination, :presence => true
    
    validates :name, :presence => true

end
