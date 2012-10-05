Boda::Application.routes.draw do

  resources :messages

  root to: "landing#index"

  devise_for :users
  devise_for :administrators
  
  match "/inicio" => "home#index", as: :home
  match "/laboda" => "home#weeding", as: :weeding
  match "/lista_de_regalos" => "home#presents", as: :presents
  match "/mas_info" => "home#about", as: :about
  match "/yovoy" => "home#confirm", as: :confirmation
  match "/entorno" => "home#area", as: :area
  
  get "landing/index"
  post "landing/create_access_request"
  get "home/confirm_guest"
  get "home/cancel_guest"
  put "home/update_guest"
  
  namespace :admin do 
    root to: "main#index"
    
    resources :access_requests do
      member do 
        get :approve
        get :reject
      end
    end
    
    resources :guests do
      collection do
        get :list_csv
      end
    end
  end
  
end
