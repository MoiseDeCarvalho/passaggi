class FeedbackPath < ApplicationRecord
	belongs_to :user
	#belongs_to :path_offers
	#def typeVehicle
     # return TypeVehicle.all #-> returns first instance of `OtherModel` & then displays "name"
   #	end
#def self.search(params)
		#conditions = String.new
    	#wheres = Array.new
    	#if params["user_id"]
    	#	if params["user_id"].to_i > 0
    	#		if conditions.length == 0
    	#			conditions << "users.id  = ? "
    	#		else
		#			conditions << "and users.id  = ? "
    	#		end
    	#		wheres << params["user_id"].to_i
    	#	end    			
    	#end
    	#if params["path_offer_id"]
    	#	if params["path_offer_id"].to_i > 0
    	#		if conditions.length == 0
    	#			conditions << "pathoffers.id  = ? "
    	#		else
		#			conditions << "and pathoffers.id  = ? "
    	#		end
    	#		wheres << params["path_offer_id"].to_i
    	#	end    			
    	#end
    	#	joins(:pathoffer)
    	#	.joins(:pathoffer)
    	#	joins(:user)
    	#	.joins(:user)
    	#	.paginate(page: params[:page], per_page: 5)
    	#end
  #  end 


	
end
