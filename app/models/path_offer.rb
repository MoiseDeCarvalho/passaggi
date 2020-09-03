class PathOffer < ApplicationRecord
	belongs_to :user
    has_many :feedback
    has_many :feedback_path
    belongs_to :vehicle

	def self.search(params)

		if !params["type_vehicle_id"].present?
			#se non invio il parametro type_vehicle_id faccio questo
		    if params[:date_departure].present?
		    	dateTmp = params["date_departure"]
		    	year = dateTmp["date_departure(1i)"]
		    	month = dateTmp["date_departure(2i)"]
		    	day = dateTmp["date_departure(3i)"]
		    	@date_dep = Date.new(year.to_i, month.to_i, day.to_i)
		    end
	        if params[:date_arrive].present?
		    	dateTmpArr = params["date_arrive"]
		    	yearArr = dateTmpArr["date_arrive(1i)"]
		    	monthArr = dateTmpArr["date_arrive(2i)"]
		    	dayArr = dateTmpArr["date_arrive(3i)"]
		    	@date_arr = Date.new(yearArr.to_i, monthArr.to_i, dayArr.to_i)
		    end
		    where("departure LIKE ?", "%#{params[:departure]}%") if params[:departure].present?
		    where("arrive LIKE ?", "%#{params[:arrive]}%") 		if params[:arrive].present?
		    where("date_departure >= ?", "#{@date_dep}") 		if !@date_dep.nil?
		    #where("date_arrive <= ?", "#{@date_arr}") 		if !@date_arr.nil?
	        where("(max_available-booked) >= ?", "%#{params[:max_available]}%") 		if params[:max_available].present?
		    where("price >= ?", "%#{params[:price_min]}%") 		if params[:price_min].present?
		    where("price <= ?", "%#{params[:price_max]}%") 		if params[:price_max].present?
		    where("full = 0") 
		    .paginate(page: params[:page], per_page: 5)
	    else
	    	#se  invio il parametro type_vehicle_id faccio questo JOIN tra pathOffer e vehicle
            PathOffer.where(vehicle_id: params[:type_vehicle_id])
            Vehicle.joins(:type_vehicle_id).where(type_vehicle_id: { vehicle_id: params[:type_vehicle_id] })
	    end
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
	end

	#cancellazione di una prenotazione
	def self.path_delete_booked(params)
		f_path = FeedbackPath.find_by(:path_offer_id => params[:path_offer_id], :user_id => params[:current_user_id])
		path = PathOffer.find(params[:path_offer_id])
		path.booked -= f_path.booked
		path.save!
		f_path.destroy

	end
	#def self.Vehicle
     # return Vehicle.all #-> returns first instance of `OtherModel` & then displays "name"
   	#end
end
