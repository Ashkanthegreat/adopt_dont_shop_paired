class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @fav_pet = favorite.is_a_favorite?(@pet.id)
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create!(pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)

    redirect_to "/pets/#{pet.id}"
  end

  def multi_approve
    params[:selected_pet_ids].each do |selected_pet_id|
      selected_pet_id = selected_pet_id.to_i
      pet = Pet.find(selected_pet_id)
      pet.update(adoption_status: "Pending")
    end
    redirect_to "/favorites"
  end

  def destroy
    pet = Pet.find(params[:id])
    favorite = Favorite.new(session[:favorite])
    if favorite.is_a_favorite?(pet.id)
      favorite.remove_pet(pet.id)
      session[:favorite] = favorite.favorite_pets
    end

    Pet.destroy(params[:id])
    redirect_to "/pets"
  end

  private

  def pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :adoption_status)
  end
end
