Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'create_study', to: 'studies#create'
  get 'studies', to: 'studies#index'
  patch 'update_study/:id', to: 'studies#update'

  resources :studies do
    member do
      get :delete
    end
  end
  resources :study_groups
  get 'study_groups', to: 'study_groups#index'
end
