Boda::Application.routes.draw do

  root to: "landing#index"

  devise_for :users
  devise_for :administrators
  
  match "/inicio" => "home#index", as: :home
  match "/laboda" => "home#weeding", as: :weeding
  match "/lista_de_regalos" => "home#presents", as: :presents
  match "/mas_info" => "home#about", as: :about
  match "/yovoy" => "home#confirm", as: :confirmation
  
  get "landing/index"
  post "landing/create_access_request"

  namespace :admin do 
    root to: "main#index"
    
    resources :access_requests do
      member do 
        get :approve
        get :reject
      end
    end
    
    resources :guests 
  end
  
end
