class Feedback < ApplicationRecord
	belongs_to :user
	belongs_to :path_offer 
#def self.search(params)
		#conditions = String.new
    	#wheres = Array.new
    	
    #	if params["score"]
    	#	if params["score"].to_i > 0
    	#		if conditions.length == 0
    	#			conditions << "score  = ? "
    	#		else
			#		conditions << "and score = ? "
    		#	end
    		#	wheres << params["score"].to_i
    		#end    			
    	#end
    	#if wheres.length > 0
    	#	wheres.insert(0, conditions)
		 #	.where(wheres)
	    #	.paginate(page: params[:page], per_page: 5)
    	#end
  #  end 
end
