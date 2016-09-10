Rails.application.routes.draw do
  get 'settings/edit'
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
    resources :other_skills
    resources :clearances
    resources :certifications
    resources :educations, only: [:show, :edit, :index]
    resources :contacts, only: [:show, :edit, :index]  do
      resources :contact_extend_demographies, only: [:create, :update], controller: :extend_demographies
    end
    resources :organizations, only: [:show, :edit, :index] do
      resources :organization_extend_demographies, only: [:create, :update], controller: :extend_demographies
    end
    resources :documents, only: [:show, :edit, :index]
    resources :core_demographics, only: [:create, :update]
    resources :job_details, only: [:create, :update]
    resources :user_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end
  resources :departments do
    resources :department_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end

  resources :other_skills
  resources :clearances
  resources :certifications
  resources :educations
  resources :languages
  resources :positions
  resources :contacts do
    resources :contact_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end
  resources :organizations do
    resources :organization_extend_demographies, only: [:create, :update], controller: :extend_demographies
  end
  resources :documents

  resources :employees, only: [:index, :show, :destroy, :update] do
    member do
      get 'log_in'
    end

    get 'home/index', as: 'home'
    resources :educations
    resources :languages
    resources :departments
    resources :positions
    resources :other_skills
    resources :clearances
    resources :certifications
    resources :contacts do
      resources :contact_extend_demographies, only: [:create, :update], controller: :extend_demographies
    end
    resources :organizations do
      resources :organization_extend_demographies, only: [:create, :update], controller: :extend_demographies
    end
    resources :documents
  end

  resources :enumerations
  resources :roles
  resources :settings, only: [:index, :create]
end
