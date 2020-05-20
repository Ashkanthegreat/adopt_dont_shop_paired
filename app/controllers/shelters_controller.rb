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
    # @pets = Shelter.find(params[:shelter_id]).pets
    # @shelter_id = params[:shelter_id]
  end

  def create
    shelter = Shelter.new({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip],
      })

    shelter.save

    redirect_to "/shelters"
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip],
      })

      shelter.save

      redirect_to "/shelters/#{shelter.id}"
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

  def review

  end

end
