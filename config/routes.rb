Mnprograms::Application.routes.draw do
  
  resources :types
  
  resources :users, :only => [:create]
  
  devise_for :users, :controllers => { :registrations => "registrations" }, :skip => [:sessions] do
    get 'signup' => 'registrations#new', :as => :new_user_registration
    get 'account' => 'registrations#edit', :as => :edit_user_registration
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    get 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  resources :users, :except => [:create]
  
  resources :profiles
  
  match '/auth/:service/callback' => 'services#create' 
  resources :services, :only => [:index, :create, :destroy]
  
  resources :programs do

    resources :submissions do
  		resources :works
	
  		member do
  		  post :rate
		  end
  	end

    member do
      put :set_default
      get :description
      get :guidelines
      get :thankyou
    end

  end
  
  
=begin  match '/:url', :to => 'programs#show'
  match '/:url/description', :to => 'programs#description', :method => :get
  match '/:url/guidelines', :to => 'programs#guidelines', :method => :get
  match '/:url/thankyou', :to => 'programs#thankyou', :method => :get
=end  
  
  root :to => "programs#index"

end
