class Vehicle < ApplicationRecord
	belongs_to :user
	belongs_to :type_vehicle
	has_many :path_offer
	
    def typeVehicle
     return TypeVehicle.all #-> returns first instance of `OtherModel` & then displays "name"
   	end
    def self.vehicles_search(params)
		conditions = String.new
    	wheres = Array.new
    	
    	if params["brand"]
    		if params["brand"].length > 0
                if conditions.length == 0
    			     conditions << "LOWER(brand) = ? " 
    	        else
    				    conditions << "and LOWER(brand) = ? "	
    		    end		
    			wheres << params["brand"].downcase
    		end    			
    	end

    	
    	if params["model"]
    		if params["model"].length > 0
    			if conditions.length == 0
    				conditions << "LOWER(model) = ? "
    			else
    				conditions << "and LOWER(model) = ? "
    			end    			
    			wheres << params["model"].downcase
    		end    			
    	end

    	if params["colour"]
    		if params["colour"].length > 0
                if conditions.length == 0
    			     conditions << "LOWER(colour) = ? " 	
    			else
    				    conditions << "and LOWER(colour) = ? "	
    			end	
    			wheres << params["colour"].downcase
    		end    			
    	end
    	
    	if params["motor"]
    		if params["motor"].to_i > 0
    			if conditions.length == 0
    				conditions << "motor  = ? "
    			else
		      		conditions << "and motor = ? "
    			end
    			wheres << params["motor"].to_i
    		end    			
    	end

    	type_vehicle_id tipo di veicolo
    	if params["type_vehicle_id"]
    		if params["type_vehicle_id"].to_i > 0
    			if conditions.length == 0
    				conditions << "type_vehicles.id  = ? "
    			else
					conditions << "and type_vehicles.id  = ? "
    			end
    			wheres << params["type_vehicle_id"].to_i
    		end    			
    	end

    	if wheres.length > 0
    		wheres.insert(0, conditions)
    		.joins(:type_vehicle)
			.where(wheres)
	    	.paginate(page: params[:page], per_page: 5)
    	else
    		joins(:type_vehicle)
    		.joins(:type_vehicle)
    		.paginate(page: params[:page], per_page: 5)
    	end
    end 
   	has_attached_file :photo_1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing_auto.jpg"
	validates_attachment_content_type :photo_1, content_type: /\Aimage\/.*\z/

	has_attached_file :photo_2, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing_auto.jpg"
	validates_attachment_content_type :photo_2, content_type: /\Aimage\/.*\z/
end
