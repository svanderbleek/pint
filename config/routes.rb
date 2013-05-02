Pint::Application.routes.draw do
  get "launch/index"
  root to: 'launch#index'

  namespace :github do
    post :auth
  end
end
