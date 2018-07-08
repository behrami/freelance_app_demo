class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      flash.now[:notice] = 'Successful Sign In'
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:notice] = 'Unsuccessful Sign In'
      if request.xhr?
        render json: {failed: 'Unsuccessful Sign In'}
      else
        render :new
      end

    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Successful Sign Out'
    redirect_to root_path
  end

end
