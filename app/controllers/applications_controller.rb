class ApplicationsController < ApplicationController

  def new
    favorite = Favorite.new(session[:favorite])
    @pets = favorite.id_to_object
  end

  def create
    Application.new(application_params)
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone, :description)
  end
end
