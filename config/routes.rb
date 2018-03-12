Rails.application.routes.draw do
  resources :questiontypes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
       devise_for :users, controllers: {
         sessions: 'users/sessions',
         registrations: 'users/registrations'
       }


  get 'inicios/Index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "inicios#Index"

end
