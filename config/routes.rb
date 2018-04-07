Rails.application.routes.draw do



  resources :units
  resources :options
  resources :questiontypes
   # resources :plans

  resources :plans do
    member do
      delete 'destroyplansoption/:option_id', to: 'plans#destroyplansoption', as: 'destroyplansoption'
      delete 'destroycourseplan/:course_id', to: 'plans#destroycourseplan', as: 'destroycourseplan'
    end
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
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


  resources :inicios, only: [:index,:show]
  #  do
  #   delete 'orders/:order_id', to: 'products#destroy',  as: 'destroy'
  #   resource  :orders, only: [:create]
  # end

  # get 'inicios/Index'
  root to: "inicios#Index"

end
