class PathOffer < ApplicationRecord
	belongs_to :user
    has_many :feedback
    has_many :feedback_path


	def self.search(params)
	    if params[:date_departure].present?
	    	dateTmp = params["date_departure"]
	    	year = dateTmp["date_departure(1i)"]
	    	month = dateTmp["date_departure(2i)"]
	    	day = dateTmp["date_departure(3i)"]
	    	@date_dep = Date.new(year.to_i, month.to_i, day.to_i)
	    end

	    where("departure LIKE ?", "%#{params[:departure]}%") if params[:departure].present?
	    where("arrive LIKE ?", "%#{params[:arrive]}%") 		if params[:arrive].present?
	    where("date_departure >= ?", "#{@date_dep}") 		if !@date_dep.nil?

	  
	end

	def self.path_booked(params)

		feedback_paths_obj = FeedbackPath.new(:user_id => params[:current_user_id], :path_offer_id => params[:path_offer_id])
		feedback_paths_obj.save!

		data = PathOffer.find(params[:path_offer_id])
	 	value = params[:old_value].to_i + params[:booked].to_i

	 	if data.max_available == value
	 		data.update_attribute(:max_available, 1)
		end
		
		data.update_attribute(:booked, value)
	end
end
