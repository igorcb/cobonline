Rails.application.routes.draw do
  resources :current_accounts do
    collection do
      get 'index_user_operator'
    end
  end
  #match '/current_accounts/index_user_operator', :controller => 'current_accounts', :action => 'index_user_operator', via: [:get]
  resources :costs
  match 'recalculation/:id' => "advances#recalculation", :as => 'recalculation', via: [:get]
  
  devise_for :users
  resources :item_advances
  resources :advances
  resources :clients
  resources :holidays
  resources :cities

  match '/dashboard',  to: 'static_pages#dashboard',         via: 'get'
 
  root 'item_advances#index'


end
