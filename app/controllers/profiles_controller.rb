class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index

    if request["id"].nil?
      id = current_user.id
    else
      id = request["id"]
    end
    #logger.info("id " + id)
    @profile = Profile.find_by(:user_id => id)
    @score = Score.find_by(:user_id => id)
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show

  end

  # GET /profiles/new
  def new
    @profile = current_user.build_profile
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = current_user.build_profile(profile_params)

    @score = Score.find_by(:user_id => current_user.id)
    if @score.nil?
      # creo il record Score per l utente così la join di ricerca funziona
      @score = Score.new
      @score.user_id = current_user.id
      @score.score = 0
      @score.count = 0
      @score.total = 0
      @score.save!
    end

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profiles_url, notice: 'Profilo correttamente inserito' }
      else
        format.html { render :new }
      end
    end
  end

  def disattiva
    logger.info("disattiva " + params["id"])
    @user = User.find(params["id"])
    @user.active = 1
    @user.save!
  end

  def riattiva
    logger.info("riattiva " + params["id"])
    @user = User.find(params["id"])
    @user.active = 0
    @user.save!
  end
 #GET /search
  #def search_result
  #  @profiles_founded = Profiles.search(params)
   
  #end
  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profiles_url}
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profilo cancellato correttamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :surname, :address, :city, :mobile, :description, :avatar)
    end

    #checko l'utente per le modifiche cancellazioni
    def check_user
      if current_user != @profile.user
        redirect_to root_url, alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end