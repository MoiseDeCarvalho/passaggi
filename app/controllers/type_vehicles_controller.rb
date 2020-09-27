class TypeVehiclesController < ApplicationController
  before_action :set_type_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /type_vehicles
  # GET /type_vehicles.json
  def index
    @type_vehicles = TypeVehicle.all.paginate(page: params[:page], per_page: 5)
  end

  # GET /type_vehicles/1
  # GET /type_vehicles/1.json
  def show
  end

  # GET /type_vehicles/new
  def new
    @type_vehicle = TypeVehicle.new
  end

  # GET /type_vehicles/1/edit
  def edit
  end

  # POST /type_vehicles
  # POST /type_vehicles.json
  def create
    @type_vehicle = TypeVehicle.new(type_vehicle_params)

    respond_to do |format|
      if @type_vehicle.save
        format.html { redirect_to @type_vehicle, notice: 'Type vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @type_vehicle }
      else
        format.html { render :new }
        format.json { render json: @type_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_vehicles/1
  # PATCH/PUT /type_vehicles/1.json
  def update
    respond_to do |format|
      if @type_vehicle.update(type_vehicle_params)
        format.html { redirect_to @type_vehicle, notice: 'Type vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_vehicle }
      else
        format.html { render :edit }
        format.json { render json: @type_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_vehicles/1
  # DELETE /type_vehicles/1.json
  def destroy
    @type_vehicle.destroy
    respond_to do |format|
      format.html { redirect_to type_vehicles_url, notice: 'Type vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_vehicle
      @type_vehicle = TypeVehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_vehicle_params
      params.require(:type_vehicle).permit(:description)
    end
end
