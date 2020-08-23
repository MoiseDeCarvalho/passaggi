class Feedback < ApplicationRecord
	belongs_to :user
	belongs_to :path_offer 
end
