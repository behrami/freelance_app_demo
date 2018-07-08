class CitiesController < ApplicationController
  def index
    province_id = params[:province_id]

    @cities = City.where(province_id: province_id)

    if params[:profession_id]
      @profession_id = params[:profession_id]

      @users_array=[]
      @cities.each do |city|
        users=City.find_by(id: city[:id]).users.where(profession_id: @profession_id)

        users.each do |user|
          user_hash = {first_name: user.first_name, last_name: user.last_name}
          @users_array.push(user_hash)
        end

      end

    end

    respond_to do |format|
      format.html
      format.json {render json: @users_array}
    end

  end

end
