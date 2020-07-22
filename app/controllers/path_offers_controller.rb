class PathOffersController < ApplicationController
  before_action :set_path_offer, only: [:show, :edit, :update, :destroy]

  # GET /path_offers
  # GET /path_offers.json
  def index
    @path_offers = PathOffer.all
  end

  # GET /path_offers/1
  # GET /path_offers/1.json
  def show
  end

  # GET /path_offers/new
  def new
    @path_offer = PathOffer.new
  end

  # GET /path_offers/1/edit
  def edit
  end

  # POST /path_offers
  # POST /path_offers.json
  def create
    @path_offer = PathOffer.new(path_offer_params)

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
end
