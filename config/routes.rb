Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :projects
      resources :phases
      resources :roles
      resources :tech_categories
      resources :tech_tags

      root to: "projects#index"
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
