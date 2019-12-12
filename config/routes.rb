Rails.application.routes.draw do
  get 'portfolio/index'
  get 'portfolio/show'
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
    resources :projects
    resources :phases
    resources :roles
    resources :tech_categories
    resources :tech_tags

    delete 'destroy_image', to: 'projects#remove_attachment'
    root to: "projects#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "portfolio#index"
end
