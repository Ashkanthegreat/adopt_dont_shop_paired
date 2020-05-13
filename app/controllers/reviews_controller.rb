class ReviewsController < ApplicationController

 def new
   @shelter = Shelter.find(params[:id])
 end

 def create
   shelter = Shelter.find(params[:id])
   # shelter.reviews.create(review_params)
   # redirect_to "/shelters/#{shelter.id}"
   review = shelter.reviews.new(review_params)
   if review.save
     redirect_to "/shelters/#{shelter.id}"
   else
     # flash[:error] = review.errors.full_messages.to_sentence
     flash[:notice] = "Review not created - Missing required fields"
     render :new
   end
 end


 private

 def review_params
   params.delete(:picture) if params[:picture].empty?

   params.permit(:title, :rating, :content, :picture)
 end
end
