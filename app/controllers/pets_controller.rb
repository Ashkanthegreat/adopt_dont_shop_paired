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
    pet = shelter.pets.new(pet_params)
    if pet.save
      redirect_to "/shelters/#{shelter.id}/pets"
    else
      flash[:error] = pet.errors.full_messages.to_sentence
      redirect_to "/shelters/#{shelter.id}/pets/new"
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)

    redirect_to "/pets/#{pet.id}"
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
