class FeedbackPath < ApplicationRecord
	belongs_to :user
	belongs_to :path_offers
	def self.search(params)
	end
end
