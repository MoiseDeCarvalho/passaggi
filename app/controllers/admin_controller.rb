class AdminController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

	


	#checko l'utente per le modifiche cancellazioni
    def check_user
      if !current_user.admin 
        redirect_to root_url, alert: "Scusa ma non hai accesso a questa pagina"
      end
    end
end
