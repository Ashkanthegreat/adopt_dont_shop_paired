Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "shelters#index"
  get "/shelters", to: "shelters#index"
  get "/shelters/new", to: "shelters#new"
  get "/shelters/:id", to: "shelters#show"
  post "/shelters", to: "shelters#create"
  get "/shelters/:id/edit", to: "shelters#edit"
  patch "/shelters/:id", to: "shelters#update"
  delete "/shelters/:id", to: "shelters#destroy"
  get "/shelters/:shelter_id/pets", to: "shelters#list_pets"

  get "/pets", to: "pets#index"
  get "/pets/:id", to: "pets#show"
  get "/shelters/:shelter_id/pets/new", to: "pets#new"
  post "/shelters/:shelter_id/pets", to: "pets#create"
  get "/pets/:id/edit", to: "pets#edit"
  patch "/pets/:id", to: "pets#update"
  patch "/pets", to: "pets#multi_approve"
  delete "/pets/:id", to: "pets#destroy"

  get "/shelters/:id/reviews/new", to: "reviews#new"
  post "/shelters/:id/reviews", to: "reviews#create"
  get "/shelters/:shelter_id/:review_id/edit", to: "reviews#edit"
  patch "/shelters/:shelter_id/:review_id", to: "reviews#update"
  delete "/shelters/:shelter_id/:review_id", to: "reviews#destroy"

  get "/favorites", to: "favorites#index"
  patch "/favorites/:pet_id", to: "favorites#update"
  delete "/favorites/:pet_id", to: "favorites#destroy"
  delete "/favorites", to: "favorites#destroy"

  get "/applications/new", to: "applications#new"
  get "applications/:id", to: "applications#show"
  post "applications", to: "applications#create"
  get "/pets/:id/applications/index", to: "applications#index"
  patch "/pets/:pet_id/applications/:app_id/approve", to: "applications#approve"
  # patch "/applications/:app_id", to "applications#revoke"
end
