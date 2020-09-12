class FeedbackPathsController < ApplicationController
  before_action :set_feedback_path, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  # GET /feedback_paths
  # GET /feedback_paths.json
  def index
    @feedback= FeedbackPath.where(:user_id => current_user.id)
  end

  # GET /feedback_paths/1
  # GET /feedback_paths/1.json
  def show
    @feedback= FeedbackPath.find_by(:user_id => current_user.id)
  end

  # GET /feedback_paths/new
  def new
    @feedback= current_user.feedback_path.build 
  end

  # GET /feedback_paths/1/edit
  def edit
  end

  # POST /feedback_paths
  # POST /feedback_paths.json
  def create
    @feedback_path = current_user.feedback_path.build(feedback_path_params)

    respond_to do |format|
      if @feedback_path.save
        format.html { redirect_to @feedback_path, notice: 'Feedback creato correttamente.' }
        format.json { render :show, status: :created, location: @feedback_path }
      else
        format.html { render :new }
        format.json { render json: @feedback_path.errors, status: :unprocessable_entity }
      end
    end
  end
#def search
#    @users= Profile.all
 #   @path_offers= PathOffer.all 

 # end
 #GET /search
  #def search_result
  #  @feedback_paths_founded = Feedbackpaths.search(params)
   
  #end
  # PATCH/PUT /feedback_paths/1
  # PATCH/PUT /feedback_paths/1.json
  def update
    respond_to do |format|
      if @feedback_path.update(feedback_path_params)
        format.html { redirect_to @feedback_path, notice: 'Feedback modificato correttamente.' }
        format.json { render :show, status: :ok, location: @feedback_path }
      else
        format.html { render :edit }
        format.json { render json: @feedback_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_paths/1
  # DELETE /feedback_paths/1.json
  def destroy
    @feedback_path.destroy
    respond_to do |format|
      format.html { redirect_to feedback_paths_url, notice: 'Feedback cancelalto correttamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_path
      @feedback_path = FeedbackPath.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_path_params
      params.require(:feedback_path).permit(:user_id, :path_offers_id)
    end
    def check_user
      if current_user.id != @feedback_path.user_id
        redirect_to root_url, alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end
