class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def list_pets
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets
  end

  def create
    shelter = Shelter.new(shelter_params)

    if shelter.save
      redirect_to "/shelters"
    else
      flash[:error] = shelter.errors.full_messages.to_sentence
      redirect_to "/shelters/new"
    end

  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
      if shelter.update(shelter_params)
        redirect_to "/shelters/#{shelter.id}"
      else
        flash[:error] = shelter.errors.full_messages.to_sentence
        redirect_back fallback_location: "/shelters/#{shelter.id}"
      end
  end

  def destroy
    shelter = Shelter.find(params[:id])
    approved_pets = shelter.pets.find_all do |pet|
      pet.pet_applications.any? {|pet_app| pet_app.approved}
    end
    if shelter.pets.any? {|pet| pet.adoption_status == "Pending"}
      flash[:notice] = "Can not delete this shelter"
      redirect_back fallback_location: "/shelters"
    elsif approved_pets.length > 0
      flash[:notice] = "Can not delete this shelter"
      redirect_back fallback_location: "/shelters"
    else
    Shelter.destroy(params[:id])
    redirect_to "/shelters"
    end
  end

  private

  def shelter_params
    params.permit(:name, "address", :city, :state, :zip)
  end

end
