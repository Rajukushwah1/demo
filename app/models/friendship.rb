class Friendship < ApplicationRecord
	belongs_to :user
    belongs_to :friend, :class_name => 'User'

    has_many :pending_friends,
         :through => :friendshipes,
         :source => :friend,
         :conditions => "confirmed = 0" 
end
