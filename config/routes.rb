Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "artist#index"
  
  resources :artists do
    resources :albums
  end
  resources :groups do
    resources :albums
  end
  resources :albums do
    resources :songs
  end
end
