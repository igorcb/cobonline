Rails.application.routes.draw do

  match "/search_current_accounts", :controller => "current_accounts", :action => "search", via: [:get]
  match "/result_search_current_accounts" => "current_accounts#search_logistic", via: [:get]
  match "/launch_current_accounts" => "current_accounts#launch_current", via: [:get, :post]

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

  match "/get_client_for_city", :controller => "advances", :action => "get_client_for_city", via: [:get]
  match '/dashboard',  to: 'static_pages#dashboard',         via: 'get'
 
  root 'item_advances#index'


end
