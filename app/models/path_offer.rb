class PathOffer < ApplicationRecord
	belongs_to :user
    has_many :feedback
    has_many :feedback_path
	def self.search(departure)
	  if departure
	   # find_by(:all, :conditions => ['departure LIKE ?', "%#{departure}%"])
	    like_keyword = "%#{departure}%"    
#MyModel.where("description LIKE ?", like_keyword)
	    where("departure LIKE ?", like_keyword)
	  #else
	   # find(:all)
	  end
	end
end
