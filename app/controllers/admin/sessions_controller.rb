class Admin::SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]
  layout "admin"

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password]) && user.admin?
      session[:user_id] = user.id
      redirect_to admin_root_path
    else
      flash.now[:alert] = "Invalid credentials or not an admin"
      render :new
    end
  end
end
