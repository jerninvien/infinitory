require 'sidekiq/web'
require 'sidetiq/web'

Infinitory::Application.routes.draw do

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  devise_for :users, path: '', path_names: { sign_in: 'login',
                                             sign_out: 'logout',
                                             sign_up: 'register' },
                               controllers: { registrations: 'registrations',
                                              invitations: 'users/invitations',
                                              confirmations: 'confirmations',
                                              sessions: 'sessions'}
 
  resources :institutes, shallow: true do
    resources :labs do
      resources :devices do
        resources :bookings
      end
      resource :account
      resources :reagents
      resources :users
      resources :collaborations
    end
  end

  resources :institutes do
    resources :departments
  end

  resources :user, only: [] do
    resources :reagents, only: [:index, :show]
    resources :devices,  only: [:index, :show]
    resources :bookings, only: [:index, :show]
  end

  resources :blog
  resources :requests, only: [:new, :create]
  resource :feedback, only: [:new, :create]
  resources :comments, only: :destroy

  get 'tags/:tag', to: 'reagents#index', as: :tag

  match 'users/:id/approve' => 'users#approve', as: 'approve_user', via: :get
  match 'users/:id/retire' => 'users#retire', as: 'retire_user', via: :get  
  match 'users/:id/reject' => 'users#reject', as: 'reject_user', via: :get

  match 'reagents/:id/clone' => 'reagents#clone', as: 'clone_reagent', via: :get
  match 'devices/:id/clone' => 'devices#clone', as: 'clone_device', via: :get

  match 'collaborations/:id/destroy_inverse' => 'collaborations#destroy_inverse', as: 'destroy_inverse', via: :get

  post 'versions/:id/revert' => 'versions#revert', as: 'revert_version'

  mount Sidekiq::Web, at: '/sidekiq'

  root :to => 'high_voltage/pages#show', id: 'splash'

  # match '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/ }, via: :get
end
