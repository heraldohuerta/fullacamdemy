Rails.application.routes.draw do


  resources :panels
  resources :questiontests , only: [:index,:create,:destroy]

  resources :units
  resources :options
  resources :questiontypes
  resources :details, only: [:index,:destroy]

  resources :plans do
    resource  :order, only: [:create]
    member do
      delete 'destroyplansoption/:option_id', to: 'plans#destroyplansoption', as: 'destroyplansoption'
      delete 'destroycourseplan/:course_id', to: 'plans#destroycourseplan', as: 'destroycourseplan'
    end
  end


  resources :billings, only: [] do
      collection do
          get 'pre_pay'
          get 'execute'
        end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }


resources :inicios, only: [:index,:show]

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


  resources :students, only: [:index] do
    collection do
      get  'detallecompra'
      get  'test/:id', to: 'students#test', as: 'test'
      post 'finalizar/:id', to: 'students#finalizar', as: 'finalizar'
    end
  end


  # get 'inicios/Index'
  root to: "inicios#index"

end
