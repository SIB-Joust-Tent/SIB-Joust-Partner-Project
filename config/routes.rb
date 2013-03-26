SIBJoustPartnerProject::Application.routes.draw do
  root to: "pages#home"
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :companies do
    member do
      get :analytics
    end
  end
end
