class ReviewsController < ApplicationController

 def new
   @shelter = Shelter.find(params[:id])
 end

 def create
   shelter = Shelter.find(params[:id])
   shelter.reviews.create(review_params)
   redirect_to "/shelters/#{shelter.id}"
 end

 private

 def review_params
   params.delete(:picture) if params[:picture].empty?

   params.permit(:title, :rating, :content, :picture)
 end
end
