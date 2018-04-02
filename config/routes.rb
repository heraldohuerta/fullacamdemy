Rails.application.routes.draw do


  resources :units
  resources :options
  resources :plans
  resources :questiontypes


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }



resources :questiontests , only: [:index,:create,:destroy]
post 'questiontests/update/:id', to: 'questiontests#update', as: 'update'





resources :tests, only: [:index,:create,:update] do
    get'armartest'
    collection do
      post 'completarasignatura'
      post 'completarcontenido'
      post 'completarprueba'
      post 'buscarprueba'
    end
    # resources:questiontests
  end

  get 'vertest',   to: 'tests#vertest',  as: 'vertest'
  post 'tests/create_question', to: 'tests#create_question', as: 'create_question'
  get 'inicios/Index'
  root to: "inicios#Index"

end
