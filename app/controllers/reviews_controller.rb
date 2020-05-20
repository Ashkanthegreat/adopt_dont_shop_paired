class ReviewsController < ApplicationController

  def new
  @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    review = shelter.reviews.new(review_params)
    if review.save
      redirect_to "/shelters/#{shelter.id}"
    else
      flash[:notice] = "Review not created - Missing required fields"
      redirect_to "/shelters/#{shelter.id}/reviews/new"
    end
  end

  def edit
    @review = Review.find(params[:review_id])
  end

  def update
    review = Review.find(params[:review_id])
    if review.update(review_params)
      redirect_to "/shelters/#{review.shelter.id}"
    else
      flash[:error] = "Review not updated: Need to fill in title, rating, and content in order to edit a shelter review"
      redirect_to "/shelters/#{review.shelter.id}/#{review.id}/edit"
    end
  end

  def destroy
    Review.destroy(params[:review_id])
    redirect_to "/shelters/#{params[:shelter_id]}"
  end

  private

  def review_params
    params.permit(:title, :rating, :content, :picture)
  end
end
