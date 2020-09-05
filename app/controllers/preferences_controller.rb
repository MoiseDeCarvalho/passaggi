class PreferencesController < ApplicationController
  before_action :set_preference, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  # GET /preferences
  # GET /preferences.json
  def index
    #@preferences = Preference.all
    @preference = Preference.find_by(:user_id => current_user.id)
  end

  # GET /preferences/1
  # GET /preferences/1.json
  def show
     @preference = Preference.find_by(:user_id => current_user.id)
  end

  # GET /preferences/new
  def new
    #@preference = Preference.new
    @preference = current_user.build_preference
  end

  # GET /preferences/1/edit
  def edit
  end
def search
    

  end
  def search_result
    #respond_to do |format|
      @preferences_founded = Preference.search(params)
     
    #end
  end
  # POST /preferences
  # POST /preferences.json
  def create
    #@preference = Preference.new(preference_params)
    @preference = current_user.build_preference(preference_params)

    respond_to do |format|
      if @preference.save
        format.html { redirect_to @preference, notice: 'Preferenze create correttamente.' }
        format.json { render :show, status: :created, location: @preference }
      else
        format.html { render :new }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preferences/1
  # PATCH/PUT /preferences/1.json
  def update
    respond_to do |format|
      if @preference.update(preference_params)
        format.html { redirect_to @preference, notice: 'Preferenze modificate correttamente.' }
        format.json { render :show, status: :ok, location: @preference }
      else
        format.html { render :edit }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferences/1
  # DELETE /preferences/1.json
  def destroy
    @preference.destroy
    respond_to do |format|
      format.html { redirect_to preferences_url, notice: 'Preferenze cancellate correttamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preference
      @preference = Preference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def preference_params     
      params.require(:preference).permit(:user_id, :conversation, :music, :smoke, :animal)
    
    end

    #checko l'utente per le modifiche cancellazioni
    def check_user
      if current_user.id != @preference.user_id
        redirect_to root_url, alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end
