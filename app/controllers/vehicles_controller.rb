class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  
  # GET /vehicles
  # GET /vehicles.json
  def index
    #@vehicles = Vehicle.all
    @vehicle = Vehicle.find_by(:user_id => current_user.id)
    @typeVehicles = TypeVehicle.all
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    @vehicle = Vehicle.find_by(:user_id => current_user.id)
    @typeVehicles = TypeVehicle.all
  end

  # GET /vehicles/new
  def new
    #@vehicle = Vehicle.new
    @vehicle = current_user.build_vehicle
  end

  # GET /vehicles/1/edit
  def edit
   @typeVehicles = TypeVehicle.all
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    #@vehicle = Vehicle.new(vehicle_params)
    @vehicle = current_user.build_vehicle(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Veicolo inserito correttamente.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def vehicles_search
    @typevehicles= TypeVehicle.all

  end


  #GET /search
  def search_result
    @vehicles_founded = Vehicles.search(params)
   
  end
  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Veicolo modificato correttamente.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Veicolo cancellato correttamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:user_id, :type_vehicle_id, :brand, :model, :motor, :colour, :photo_1, :photo_2)
    end

    #checko l'utente per le modifiche cancellazioni
    def check_user
      if current_user.id != @vehicle.user_id
        redirect_to root_url, alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end
