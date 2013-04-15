class UsersController < ApplicationController
  respond_to :json

  def index
    respond_to do |format|
      format.json { render json: User.all }
    end
  end
end
