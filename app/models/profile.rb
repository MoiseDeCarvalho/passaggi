class Profile < ApplicationRecord
	belongs_to :user

    

	#def self.search(params)
		#conditions = String.new
    	#wheres = Array.new
		#if params["data_di_nascita"].present?
		#    date_di_nascita = params["data_di_nascita"]
		#    date_nascita= DateTime.parse(date_di_nascita).to_s(:db)    
		#end   
		#if params["data_di_nascita"]
    	#	if params["data_di_nascita"].length > 0
    	#		if conditions.length == 0
    	#			conditions << "date_di_nascita >= ? "
    	#		else
    	#			conditions << "and date_di_nascita >= ? "
    	#		end    			
    	#		wheres << data_nascita
    	#	end    			
    #	end

    	#if params["name"]
    	#	if params["name"].length > 0
    	#		conditions << "LOWER(name) = ? " 
    		#	else
    		#		conditions << "and LOWER(name) = ? "	
    		#	end		
    		#	wheres << params["name"].downcase
    	#	end    			
    	#end

    	
    	#if params["surname"]
    	#	if params["surname"].length > 0
    		#	if conditions.length == 0
    		#		conditions << "LOWER(surname) = ? "
    		#	else
    		#		conditions << "and LOWER(surname) = ? "
    		#	end    			
    		#	wheres << params["surname"].downcase
    	#	end    			
    	#end
    	#if params["address"]
    		#if params["address"].length > 0
    		#	conditions << "LOWER(address) = ? " 	
    		#	else
    		#		conditions << "and LOWER(address) = ? "	
    		#	end	
    		#	wheres << params["address"].downcase
    	#	end    			
    #	end
    	
    #	if params["city"]
    	#	if params["city"].to_i > 0
    	#		if conditions.length == 0
    	#			conditions << "city  = ? "
    	#		else
			#		conditions << "and city = ? "
    		#	end
    		#	wheres << params["city"].to_i
    		#end    			
    	#end

    #	if params["mobile"]
    #		if params["mobile"].to_i > 0
    #			if conditions.length == 0
    #				conditions << "mobile = ? "
    #			else
	#				conditions << "and  mobile= ? "
    #			end
    	#		wheres << params["mobile"].to_i
    	#	end    			
    #	end
    	#if wheres.length > 0
    	#	wheres.insert(0, conditions)
		 #	.where(wheres)
	    #	.paginate(page: params[:page], per_page: 5)
    	#end
  #  end 
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	
end
