Rails.application.routes.draw do
  
  devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to:'homes#top'
    get '/my_page' => 'users#mypage'
    
    resources :users, only: [:edit, :show, :update] do
      member do
        get :favorite
      end
    end
    
    resources :posts, only: [:index, :show] do
      resources :comments
      resource :favorite, only: [:create, :destroy]
    end
    
    resources :groups do
      resource :group_user, only: [:create, :destroy]
    end
    
    resources :requests
    
  end
  
  devise_scope :user do
    post "users/guest_sign_in" , to: "public/sessions#guest_sign_in"
  end
  
  devise_for :admin, skip: [:registrations] ,controllers: {
  sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to:'homes#top'
    resources :posts do
       resources :procedures
    end
    resources :comments
    resources :departments, only: [:index, :create, :edit, :update, :destroy]
    resources :occupations, only: [:index, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
