class PathOffersController < ApplicationController
  before_action :set_path_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  # GET /path_offers
  def index
    @path_offers = PathOffer.where(:user_id => current_user.id)
    @profile = Profile.find_by(:user_id => current_user.id);

     @vehicle = Vehicle.find_by(:user_id => current_user.id)
    if !@vehicle.nil?
      @typeVehicle = TypeVehicle.find_by(:id => @vehicle.type_vehicle_id)
    end    
          
  end

 
  def show
    @path_offers = PathOffer.find_by(:user_id => current_user.id)
    @typeVehicles = TypeVehicle.all
    @vehicle = Vehicle.find_by(:user_id => current_user.id)
  end

  # GET /path_offers/new
  def new
    @path_offer = current_user.path_offers.build
    @vehicle = Vehicle.find_by(:user_id => current_user.id)
    if !@vehicle.nil?
      @typeVehicle = TypeVehicle.find_by(:id => @vehicle.type_vehicle_id)
    end
    
  end


  # GET /path_offers/1/edit
  def edit
    @vehicle = Vehicle.find_by(:user_id => current_user.id)
    @typeVehicle = TypeVehicle.find_by(:id => @vehicle.type_vehicle_id)
  end

  def search
    

  end

#GET /serach
  def search_result
    #respond_to do |format|
      @path_offers_founded = PathOffer.search(params)
      #trovo eventualemente percorsi gia prenotati dall'utente 
      @booked_for_user = FeedbackPath.find_by(:user_id => current_user.id)
  #  end
  end

  #GET /update-path-booked'
  def update_path_booked
    @p = PathOffer.path_booked(params)

    #send email di conferma di prenotazione all'utente che ha creato il passaggio e all'utente che ha prenotato il passaggio
    #UserMailer.path_offer_confirmation(current_user).deliver
    render :json => "Prenotazione eseguita correttamente"    
  end


  #GET /delete-path-booked
  def delete_path_booked
    @p = PathOffer.path_delete_booked(params)
    render :json => "Cancellazione eseguita correttamente"
  end

  #GET /used
  def used
    @t = FeedbackPath.find_by(:user_id => current_user.id)
    @paths = PathOffer.find(Array(@t).map(&:path_offer_id).uniq)
  end


  # POST /path_offers
  # POST /path_offers.json
  def create
    @path_offer =  current_user.path_offers.build(path_offer_params)

    respond_to do |format|
      if @path_offer.save
        format.html { redirect_to @path_offer, notice: 'Path offer was successfully created.' }
        format.json { render :show, status: :created, location: @path_offer }
      else
        format.html { render :new }
        format.json { render json: @path_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /path_offers/1
  # PATCH/PUT /path_offers/1.json
  def update
    respond_to do |format|
      if @path_offer.update(path_offer_params)
        format.html { redirect_to @path_offer, notice: 'Path offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @path_offer }
      else
        format.html { render :edit }
        format.json { render json: @path_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /path_offers/1
  # DELETE /path_offers/1.json
  def destroy
    @path_offer.destroy
    respond_to do |format|
      format.html { redirect_to path_offers_url, notice: 'Path offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_path_offer
      @path_offer = PathOffer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def path_offer_params
      params.require(:path_offer).permit(:vehicle_id, :user_id, :departure, :arrive, :date_departure, :date_arrive, :price, :max_available, :booked, :full)
    end

    #checko l'utente per le modifiche cancellazioni
    def check_user
      if current_user.id != @path_offer.user_id
        redirect_to root_url, alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end
