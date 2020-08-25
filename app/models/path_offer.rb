class PathOffer < ApplicationRecord
	belongs_to :user
    has_many :feedback
    has_many :feedback_path
	def self.search(departure)
	  if departure
	    find(:all, :conditions => ['departure LIKE ?', "%#{departure}%"])
	  #else
	    #find(:all)
	  end
	end
end
