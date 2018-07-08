Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  # for api vvv
  namespace :api do
  	namespace :v1 do
  		# routes for viewing
  		resources :professionals, only: [:index, :show]
  		#for creating professional
  		resource :addprofessional, only: [:create]
  	end
  end

  #signup and signin Route with appointments
  resource :user, only: %i[new create edit update]
  resource :session, only: %i[new create destroy] do
    resources :appointments, only: %i[index edit update destroy]
  end

  #basic routes for professions
  resources :professions, only: %i[index] do

    resources :countries, only: %i[index] do
      resources :provinces, only: %i[index]
    end

    resources :provinces, only: %i[index] do
      resources :cities, only: %i[index]
    end

    resources :cities, only: %i[index] do
      resources :users, only: %i[index show]
    end

  end

  #more routes for locations
  resources :countries, only: %i[index] do
    resources :provinces, only: %i[index]
  end

  resources :provinces, only: %i[index] do
    resources :cities, only: %i[index]
  end

  resources :cities, only: %i[index] do
    resources :professions, only: %i[index] do
      resources :users, only: %i[index show]
    end
  end

  #routes for booking/editing appointments
  resources :users, only: %i[show] do
    resources :appointments, only: %i[new create]
  end

end
