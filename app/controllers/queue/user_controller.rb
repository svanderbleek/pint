class Queue::UserController < ApplicationController
  def update
    User.find(params[:id]).update(token: params[:token])
  end
end
