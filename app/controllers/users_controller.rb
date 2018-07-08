class UsersController < ApplicationController
  def index
    @city_id = params[:city_id]
    @profession_id = params[:profession_id]

    @users = User.where(city_id: @city_id, profession_id: @profession_id)

    respond_to do |format|
      format.html
      format.json {render json: @users}
    end

  end

  def show
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    @profession_id = params[:profession_id]

    respond_to do |format|
      format.html
      format.json {render json: @user}
    end

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.phone_number = params[:user][:phone_number]
    @user.summary = params[:user][:summary]
    @user.picture = params[:user][:picture]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.profession_id = params[:user][:profession_id]
    @user.city_id = params[:user][:city_id]

    if @user.save
      flash.now[:notice] = 'Successful Sign Up'
      redirect_to root_path
    else
      flash.now[:notice] = 'Unsuccessful Sign Up'
      if request.xhr?
        render json: {failed: 'Unsuccessful Sign Up'}
      else
        render :new
      end
    end

  end

end
