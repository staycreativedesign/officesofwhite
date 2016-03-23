Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  root 'pages#index'

  get 'waiting-for-approval' => 'pages#waiting_for_approval', as: "waiting_for_approval"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users do
    resources :receipts, only: [:index]
  end

  namespace :admin do
    resources :panel, only: [:index]
    resources :receipts
    resources :users
  end

  get '/steps' => 'steps#index'
  patch '/steps/upload_documents' => 'steps#upload_documents', as: :upload_documents
end
