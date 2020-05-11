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
  delete "/pets/:id", to: "pets#destroy"
end
