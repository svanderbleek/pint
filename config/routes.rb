Tun::Application.routes.draw do
  get "user/update"
  get "launch/index"
  root to: 'launch#index'

  namespace :queue do
    resource :user, only: :update
  end

  namespace :github do
    resource :auth, only: [:new, :show]
  end
end
