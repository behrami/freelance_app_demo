class ProvincesController < ApplicationController
  def index
    country_id= params[:country_id]

    @provinces = Province.where(country_id: country_id)

    if params[:profession_id]
      @profession_id = params[:profession_id]

      @users_array=[]
      @provinces.each do |province|
        cities = Province.find_by(id: province[:id]).cities.all
        cities.each do |city|
          users=City.find_by(id: city[:id]).users.where(profession_id: @profession_id)

          users.each do |user|
            user_hash = {first_name: user.first_name, last_name: user.last_name}
            @users_array.push(user_hash)
          end

        end
      end
      
    end



    respond_to do |format|
      format.html
      format.json {render json: @users_array}
    end

  end

end
