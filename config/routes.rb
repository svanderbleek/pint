Pint::Application.routes.draw do
  get "github/auth"
  namespace :github do
    post :auth
  end
end
