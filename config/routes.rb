Rails.application.routes.draw do


  resources :questiontypes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'tests/tests',   to: 'tests#tests',  as: 'test'
  post 'tests/insert', to: 'tests#insert', as: 'insert'

  post 'tests/grabar_test', to: 'tests#grabar_test', as: 'grabar_test'
  post 'tests/grabar_question', to: 'tests#grabar_question', as: 'grabar_question'


  post 'tests/completarasignatura', to: 'tests#completarasignatura', as: 'completarasignatura'
  post 'tests/completarcontenido', to: 'tests#completarcontenido', as: 'completarcontenido'



  get 'inicios/Index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "inicios#Index"

end
