class FavoritesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @pets = favorite.favorite_pets.map do |pet_id|
      Pet.find(pet_id)
    end
    if favorite.total_count == 0
      flash[:notice] = "You have no favorited pets"
    end
  end

  def update
    pet = Pet.find(params[:pet_id])
    favorite = Favorite.new(session[:favorite])
    favorite.add_pet(pet.id)
    session[:favorite] = favorite.favorite_pets
    flash[:notice] = "#{pet.name} has been added to your favorites list"
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    if params[:pet_id].nil?
      favorite.remove_all
    else
      pet = Pet.find(params[:pet_id])
      favorite.remove_pet(pet.id)
      session[:favorite] = favorite.favorite_pets
      flash[:notice] = "#{pet.name} has been removed from Favorites"
    end
    redirect_back fallback_location: "/favorites"
  end


end
