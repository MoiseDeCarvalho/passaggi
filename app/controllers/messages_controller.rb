class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.where(:user_id => current_user.id).paginate(page: params[:page], per_page: 5)
  end

  def message_received
    logger.info("sono qui")
   #messageReceived()
    
    @messages = Message.where(:dest_user_id => current_user.id).paginate(page: params[:page], per_page: 5)

  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @path = PathOffer.find_by(:id => params["path_offer_id"])
    @sender = Profile.find_by(:user_id => current_user.id)
    @receiver = Profile.find_by(:user_id => @path.user_id)
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_url, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:user_id, :dest_user_id, :path_offer_id, :title, :message, :sender_name, :receiver_name)
    end

    #checko l'utente per le modifiche cancellazioni
    def check_user
      if current_user.id != @message.user_id
        redirect_to root_url, alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end
