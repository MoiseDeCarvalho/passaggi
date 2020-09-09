class PathOffer < ApplicationRecord
	belongs_to :user
    has_many :feedback
    has_many :feedback_path
    belongs_to :vehicle
    has_one :type_vehicle, :through => :vehicle


	def self.search(params)
		# costruisco date_departure
		if params["data_partenza"].present? 
		    date_departure = params["data_partenza"] + " " + params["ora_partenza"]
		    date_dep = DateTime.parse(date_departure).to_s(:db)   
		end

		    #costruisco date_arrive
		if params["data_arrivo"].present?
		    date_arrive = params["data_arrivo"] + " " + params["ora_arrivo"]
		    date_arr = DateTime.parse(date_arrive).to_s(:db)    
		end   

		
		conditions = String.new
    	wheres = Array.new

    	
    	# departure
    	if params["departure"]
    		if params["departure"].length > 0
    			conditions << "LOWER(departure) = ? " 			
    			wheres << params["departure"].downcase
    		end    			
    	end

    	#arrive
    	if params["arrive"]
    		if params["arrive"].length > 0
    			if conditions.length == 0
    				conditions << "LOWER(arrive) = ? "
    			else
    				conditions << "and LOWER(arrive) = ? "
    			end    			
    			wheres << params["arrive"].downcase
    		end    			
    	end

    	#date_departure
    	if params["data_partenza"]
    		if params["data_partenza"].length > 0
    			if conditions.length == 0
    				conditions << "date_departure >= ? "
    			else
    				conditions << "and date_departure >= ? "
    			end    			
    			wheres << date_dep
    		end    			
    	end

    	#date_arrive
    	if params["data_arrivo"]
    		if params["data_arrivo"].length > 0
    			if conditions.length == 0
    				conditions << "date_arrive <= ? "
    			else
					conditions << "and date_arrive <= ? "
    			end
    			wheres << date_arr
    		end    			
    	end

    	#Nr. posti max_available
    	if params["max_available"]
    		if params["max_available"].to_i > 0
    			if conditions.length == 0
    				conditions << "(max_available -booked ) >= ? "
    			else
					conditions << "and (max_available - booked) >= ? "
    			end
    			wheres << params["max_available"].to_i
    		end    			
    	end

    	#prezzo max price_max
    	if params["price_max"]
    		if params["price_max"].to_i > 0
    			if conditions.length == 0
    				conditions << "price  <= ? "
    			else
					conditions << "and price <= ? "
    			end
    			wheres << params["price_max"].to_i
    		end    			
    	end

    	#prezzo min price_min
    	if params["price_min"]
    		if params["price_min"].to_i > 0
    			if conditions.length == 0
    				conditions << "price  >= ? "
    			else
					conditions << "and price >= ? "
    			end
    			wheres << params["price_min"].to_i
    		end    			
    	end

    	#type_vehicle_id tipo di veicolo
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
    		joins(:vehicle)
    		.joins(:type_vehicle)
		 	.where(wheres)
	    	.paginate(page: params[:page], per_page: 5)
    	else
    		joins(:vehicle)
    		.joins(:type_vehicle)
    		.paginate(page: params[:page], per_page: 5)
    	end
		#TypeVehicle.joins(vehicle: :path_offer)
		#vehicles = Vehicle.new 
		#vehicles = 
		#Vehicle.joins(:type_vehicle) #.where(type_vehicles: { type_vehicle_id: current_user.id })
	    
		    #where("departure LIKE ?", "%#{params[:departure]}%")  
		    #.where("arrive LIKE ?", "%#{params[:arrive]}%") 		 
		    #.where("date_departure >= ?", "#{date_dep}") 		 
		    #.where("date_arrive <= ?" , "#{date_arr}")	 		
		    
 	        #where("(max_available-booked) >= ?", "%#{params[:max_available]}%") 		if params[:max_available].present?
		    #where("price >= ?", "%#{params[:price_min]}%") 		if params[:price_min].present?
		    #where("price <= ?", "%#{params[:price_max]}%") 		if params[:price_max].present?
		    #where("full = 0") 
		   
	    #else
	    	#se  invio il parametro type_vehicle_id faccio questo JOIN tra pathOffer e vehicle
            #PathOffer.where(vehicle_id: params[:type_vehicle_id])
            #Vehicle.joins(:type_vehicle_id).where(type_vehicle_id: { vehicle_id: params[:type_vehicle_id] })
	    #end
	end

	#aggiornamento delle quantità di posti prenotati
	def self.path_booked(params)

		feedback_paths_obj = FeedbackPath.new(:user_id => params[:current_user_id], :path_offer_id => params[:path_offer_id], :booked => params[:booked])
		feedback_paths_obj.save!

		data = PathOffer.find(params[:path_offer_id])
	 	value = params[:old_value].to_i + params[:booked].to_i

	 	if data.max_available == value
	 		data.update_attribute(:max_available, 1)
		end
		
		data.update_attribute(:booked, value)

		if data.max_available == value
			data.update_attribute(:full, 1)
		end

	end

	#cancellazione di una prenotazione
	def self.path_delete_booked(params)
		f_path = FeedbackPath.find_by(:path_offer_id => params[:path_offer_id], :user_id => params[:current_user_id])
		path = PathOffer.find(params[:path_offer_id])
		path.booked -= f_path.booked

		if path.max_available == (path.booked + f_path.booked)
			path.full = 0
		end

		path.save!
		f_path.destroy

	end
	#def self.Vehicle
     # return Vehicle.all #-> returns first instance of `OtherModel` & then displays "name"
   	#end
end
