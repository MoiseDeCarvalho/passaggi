class PathOffer < ApplicationRecord
	belongs_to :user

	def self.search(departure)
	  if departure
	    find(:all, :conditions => ['departure LIKE ?', "%#{departure}%"])
	  #else
	    #find(:all)
	  end
	end
end
