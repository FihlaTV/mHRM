Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"


  devise_for :users
  resources :users, only: [:index, :show, :destroy] do
    member do
      put 'change_password'
      put 'change_basic_info'
      post 'image_upload'
      get 'remove_image'
    end
    resources :educations, only: [:show, :edit, :index]
    resources :documents, only: [:show, :edit, :index]
    resources :core_demographics, only: [:create, :update]
    resources :job_details, only: [:create, :update]
    resources :user_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end
  resources :departments do
    resources :department_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end

  resources :educations
  resources :positions
  resources :contacts
  resources :organizations
  resources :documents

  resources :employees do
    resources :departments, only: [:new]
    resources :positions, only: [:new]
    resources :contacts, only: [:new]
    resources :organizations, only: [:new]
    resources :documents, only: [:new]
  end



  resources :enumerations
  resources :roles



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
