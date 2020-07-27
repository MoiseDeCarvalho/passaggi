class PathOffersController < ApplicationController
  before_action :set_path_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  # GET /path_offers
  # GET /path_offers.json
  def index
    @path_offers = PathOffer.find_by(:user_id => current_user.id)
    @typeVehicles = TypeVehicle.all
    @vehicle = Vehicle.find_by(:user_id => current_user.id)
  end

  # GET /path_offers/1
  # GET /path_offers/1.json
  def show
    @typeVehicles = TypeVehicle.all
    @vehicle = Vehicle.find_by(:user_id => current_user.id)
  end

  # GET /path_offers/new
  def new
    @path_offer = current_user.path_offers.build
    @vehicle = Vehicle.find_by(:user_id => current_user.id)
    @typeVehicle = TypeVehicle.find_by(:id => @vehicle.type_vehicle_id)
    
  end

  # GET /path_offers/1/edit
  def edit
    @vehicle = Vehicle.find_by(:user_id => current_user.id)
    @typeVehicle = TypeVehicle.find_by(:id => @vehicle.type_vehicle_id)
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
