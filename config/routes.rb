Cert::Application.routes.draw do
  devise_for :users,
      :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  as :user do
    get 'login', :to => 'devise/sessions#new', :as => 'new_user_session'
    get 'logout', :to => 'devise/sessions#destroy', :as => 'destroy_user_session'
    get 'signup', :to => 'devise/registrations#new', :as => 'new_user_registration'
  end

  resources :users, :except => [:show] do
    resources :certifications, :except => [:show] do
      resources :certification_marks, :except => [:show]
    end
  end

  resources :certifications, :except => [:show]

  resources :positions, :except => [:show]

  resources :skill_types, :except => [:show] do
    resources :skills, :except => [:show]
  end

  root :to => 'dashboard#index'
end
