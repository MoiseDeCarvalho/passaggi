class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]


  # GET /feedbacks
  # GET /feedbacks.json
  def index
    #/@feedbacks = Feedback.all
    @feedback= Feedback.where(:user_id => current_user.id)
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @feedback= Feedback.find_by(:user_id => current_user.id)
  end

  # GET /feedbacks/new
  def new
   #/@feedback = Feedback.new
    @feedback= current_user.feedback.build 
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = current_user.feedback.build(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:user_id, :path_offers_id,:feedback, :score, :id_feedback)
    end
    #checko l'utente per le modifiche cancellazioni
    def check_user
      if current_user.id != @feedback.user_id
        redirect_to root_url, alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end
