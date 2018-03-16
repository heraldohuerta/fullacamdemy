Rails.application.routes.draw do


  resources :questiontypes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  get 'tests/tests',   to: 'tests#tests',  as: 'test'
  get 'tests/questiontest',   to: 'tests#questiontest',  as: 'questiontest'
   # post 'tests/insert', to: 'tests#insert', as: 'insert'


 # ACCIONES FORMULARIO
  post 'tests/grabar_test', to: 'tests#grabar_test', as: 'grabar_test'
  post 'tests/grabar_question', to: 'tests#grabar_question', as: 'grabar_question'
  
# RUTAS JS

  post 'tests/completarasignatura', to: 'tests#completarasignatura', as: 'completarasignatura'
  post 'tests/completarcontenido', to: 'tests#completarcontenido', as: 'completarcontenido'
  post 'tests/completarprueba', to: 'tests#completarprueba', as: 'completarprueba'
  post 'tests/buscarprueba', to: 'tests#buscarprueba', as: 'buscarprueba'

#RUTAS PAGINAS

  get 'inicios/Index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "inicios#Index"

end
