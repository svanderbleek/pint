PintProgrammer::Application.routes.draw do
  get "launch/index"
  root to: 'launch#index'

  namespace :github do
    resource :auth, only: [:new, :show]
  end
end
