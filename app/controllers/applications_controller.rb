class ApplicationsController < ApplicationController

  def index
    @pet = Pet.find(params[:id])
  end

  def new
    favorite = Favorite.new(session[:favorite])
    @pets = favorite.id_to_object
  end

  def show
    @application = Application.find(params[:id])
    # binding.pry
    # @pet_apps = @application.pet_applications.all
  end

  def create
    app = Application.new(application_params)

    if params[:favorite_pet_ids].nil?
      redirect_to "/applications/new"
      flash[:notice] = "All Fields Required!"
      return
    end

    if app.save
      params[:favorite_pet_ids].each do |favorite_pet_id|
        favorite_pet_id = favorite_pet_id.to_i
        PetApplication.create!({pet_id: favorite_pet_id, application_id: app.id})
        favorite.remove_pet(favorite_pet_id)
        session[:favorite] = favorite.favorite_pets
      end
        redirect_to "/favorites"
        flash[:notice] = "Application Submitted"
    else
      redirect_to "/applications/new"
      flash[:notice] = "All Fields Required!"
    end
  end

  def approve
    app = Application.find(params[:app_id])
    pet = Pet.find(params[:pet_id])
    pet.update(adoption_status: "Pending")
    pet_app = PetApplication.find_by(pet_id: pet.id, application_id: app.id)
    pet_app.update(approved: true)
    redirect_to "/pets/#{pet.id}"
  end


  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone, :description)
  end
end
