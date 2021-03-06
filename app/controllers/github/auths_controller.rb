class Github::AuthsController < ApplicationController
  def new
    redirect_to(github_authorize)
  end

  def show
    auth_job = Hopback::AuthTokenJob.new(
      curren_user.id,
      params[:code]
    )

    Hopback.enqueue(auth_job)
  end

  private

  def github_authorize
    parameters = client_id.to_param

    "https://github.com/login/oauth/authorize?#{parameters}"
  end

  def client_id
    { client_id: ENV['GITHUB_CLIENT_ID'] }
  end

  def client_secret
    { client_secret: ENV['GITHUB_CLIENT_SECRET'] }
  end
end
