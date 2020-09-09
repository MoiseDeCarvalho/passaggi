class PagesController < ApplicationController
  def home
  	@vehicles= TypeVehicle.all
  end

  def about
  end

  def search
  end

  def message
  end
end
