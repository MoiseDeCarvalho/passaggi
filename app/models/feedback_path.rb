class FeedbackPath < ApplicationRecord
	belongs_to :user
	belongs_to :path_offers
end
