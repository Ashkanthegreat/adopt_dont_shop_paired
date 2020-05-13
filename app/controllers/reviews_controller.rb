class ReviewsController < ApplicationController

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
    # review.update(review_params)
    # review.save
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
