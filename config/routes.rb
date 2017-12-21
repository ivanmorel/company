Rails.application.routes.draw do

  get 'employees/search'
  get 'employees/json'
  get 'statuses/json'
  get 'angular/calculator'
  get 'angular/index'
  resources :statuses
  resources :positions
  resources :departments
  resources :phone_types
  resources :address_types
  resources :employees do
    resources :addresses
    resources :phones
  end

end
