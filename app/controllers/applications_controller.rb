class ApplicationsController < ApplicationController

  def new
    favorite = Favorite.new(session[:favorite])
    @pets = favorite.id_to_object
  end

  def create
    app = Application.new(application_params)
    # favorite = Favorite.new(session[:favorite])
    if app.save
      params[:favorite_pet_ids].each do |favorite_pet_id|
        favorite_pet_id = favorite_pet_id.to_i
        PetApplication.create!({pet_id: favorite_pet_id, application_id: app.id})
        favorite.remove_pet(favorite_pet_id)
        session[:favorite] = favorite.favorite_pets
      end
    end
    flash[:notice] = "Application Submitted"

    redirect_to "/favorites"
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone, :description)
  end
end
