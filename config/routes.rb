SIBJoustPartnerProject::Application.routes.draw do
  root to: "pages#home"
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  namespace :angellist do
    match 'company_info' => 'api#company_info'
    match 'roles' => 'api#roles'
    match 'comments' => 'api#comments'
    match 'jobs' => 'api#jobs'
    match 'followers' => 'api#followers'
    match 'press' => 'api#press'
  end

  resources :companies do
    member do
      get :analytics
      get :history
      get :customers
    end
  end

  resources :users
end
