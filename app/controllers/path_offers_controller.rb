class PathOffersController < ApplicationController
  before_action :set_path_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]



  # GET /path_offers
  def index
    @path_offers = PathOffer.where(:user_id => current_user.id).paginate(page: params[:page], per_page: 5)
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
    @profile = Profile.find_by(:user_id => current_user.id)
    if !@vehicle.nil?
      @typeVehicle = TypeVehicle.find_by(:id => @vehicle.type_vehicle_id)
    end    
  end


  # GET /path_offers/1/edit
  def edit
    @vehicle = Vehicle.find_by(:user_id => current_user.id)
    @typeVehicle = TypeVehicle.find_by(:id => @vehicle.type_vehicle_id)
    @utenti= FeedbackPath.where(:path_offer_id => params["id"])

  end

  def search
    @vehicles= TypeVehicle.all

  end


  #GET /serach
  def search_result
    @profile = Profile.find_by(:user_id => current_user.id)
    #respond_to do |format|
    @path_offers_founded = PathOffer.search(params)
    #trovo eventualemente percorsi gia prenotati dall'utente 
    @booked_for_user = FeedbackPath.find_by(:user_id => current_user.id)
  #  end
  end

  #GET /update-path-booked'
  def update_path_booked
    PathOffer.path_booked(params)
 
    #send email di conferma di prenotazione all'utente che ha creato il passaggio e all'utente che ha prenotato il passaggio
    UserMailer.path_offer_confirmation(current_user, params).deliver
    #send mail di avviso prenotazione al creatore del passaggio
    @path_offer = PathOffer.find(params["path_offer_id"])
    profile = Profile.find_by(:user_id => current_user.id)  #trovo il profilo di chi sta prenotando
    path_offer_creator = User.find(@path_offer.user_id)
    profileCreator = Profile.find_by(:user_id => @path_offer.user_id)  #trovo il profilo di chi ha creato il viaggio
    
    UserMailer.path_offer_driver_info_path_booked(path_offer_creator, profile.name, params, current_user, profileCreator).deliver

    render :json => "Prenotazione eseguita correttamente"    
  end


  #GET /delete-path-booked
  def delete_path_booked
    PathOffer.path_delete_booked(params)
    p = PathOffer.find_by(:id => params["path_offer_id"])
    UserMailer.path_offer_delete_confirmation(current_user, params).deliver
    path_offer_creator = User.find_by(:id => p.user_id)
    user_delete_path = Profile.find_by(:user_id => current_user.id) # trovo il profilo di chi è collegato
    profileCreator = Profile.find_by(:user_id => p.user_id)  #trovo il profilo di chi ha creato il viaggio

    UserMailer.path_offer_notify_delete_confirmation(path_offer_creator.email, profileCreator, user_delete_path, p).deliver
    render :json => "Cancellazione eseguita correttamente"
  end

  #GET /used
  def used
    @t = FeedbackPath.where(:user_id => current_user.id)
    @paths = PathOffer.joins(:feedback_path).where(feedback_paths: { user_id: current_user.id })
   
  end

  def admin_paths
    @path_offers = PathOffer.all.joins(:vehicle).joins(:type_vehicle).paginate(page: params[:page], per_page: 5)
    #@profile = Profile.find_by(:user_id => current_user.id);

     #@vehicle = Vehicle.find_by(:user_id => current_user.id)
    if !@vehicle.nil?
      @typeVehicles = TypeVehicle.all
     end  
  end


  # POST /path_offers
  # POST /path_offers.json
  def create
    # costruisco date_departure
    date_departure = path_offer_params["data_partenza"] + " " + path_offer_params["ora_partenza"]
    conversione = DateTime.parse(date_departure).to_s(:db)   
    
    @path_offer =  current_user.path_offers.build(path_offer_params)
    @path_offer.date_departure = conversione

    #costruisco date_arrive
    date_arrive = path_offer_params["data_arrivo"] + " " + path_offer_params["ora_arrivo"]
    conversione = DateTime.parse(date_arrive).to_s(:db)    
    @path_offer.date_arrive = conversione

    
    if @path_offer.booked.nil?
      @path_offer.booked = 0
    end 

    if @path_offer.full.nil?
      @path_offer.full = 0
    end 

    respond_to do |format|
      if @path_offer.save
        format.html { redirect_to path_offers_url, notice: "L'inserimento del passaggio è andato a buon fine ." }
       else
        format.html { render :new }
        format.json { render json: @path_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /path_offers/1
  # PATCH/PUT /path_offers/1.json
  def update
    prenotati = FeedbackPath.where(:path_offer_id => params["id"])
    
    #se non è nil
    if !prenotati.nil?
      path_offer = PathOffer.find(params["id"])
    
      #se ci sono prenotati li avviso tramite email della cancellazione
      @creator_email = User.find_by(:id => path_offer.user_id)
      prenotati.each do | a |
      utente = User.find(a.user_id)
      
      UserMailer.path_offer_modified(@creator_email.email, utente.email, path_offer.departure, path_offer.arrive).deliver
      end
    end

    respond_to do |format|
      if @path_offer.update(path_offer_params)
        format.html { redirect_to path_offer_url, notice: 'Passaggio modificato correttamente.' }
       else
        format.html { render :edit }
       end
    end

  end
    

      
    
    
 

  # DELETE /path_offers/1
  # DELETE /path_offers/1.json
  def destroy
    @path_offer.destroy
    respond_to do |format|
      format.html { redirect_to path_offers_url, notice: 'Passaggio cancellato correttamente.' }
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
      params.require(:path_offer).permit(:data_arrivo, :ora_arrivo, :data_partenza, :ora_partenza, :vehicle_id, :user_id, :departure, :arrive, :date_departure, :date_arrive, :price, :max_available, :booked, :full, :place)
    end

    #checko l'utente per le modifiche cancellazioni
    def check_user
      if current_user.id != @path_offer.user_id
        redirect_to root_url, alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end
