class Api::V1::ProfessionalsController < ApplicationController

	def index
		if params[:city] && params[:profession]
			city = City.find_by("name like ?", "%#{params[:city]}%")
			profession = Profession.find_by("name like ?", "%#{params[:profession]}%")

			render json: User.api_return_professionals_by_city(User.where(city_id: city.id, profession_id: profession.id), city.name)
		end

		if params[:province] && params[:profession]
			if Province.find_by("name like ?", "%#{params[:province]}%") && Profession.find_by("name like ?", "%#{params[:profession]}%")
				province = Province.find_by("name like ?", "%#{params[:province]}%")
				profession = Profession.find_by("name like ?", "%#{params[:profession]}%")
				cities_list = Province.find_by(name: "#{province.name}").cities

				user_array=[]
				cities_list.each do |city|
					user_array << User.where(city_id: city.id, profession_id: profession.id)
				end

				render json: User.api_return_professionals_by_province(user_array, province.name)
			else 
				render json: {status: 'invalid search query', code: 400}
			end
		end

		if params[:country] && params[:profession]
			if Country.find_by("name like ?", "%#{params[:country]}%") && Profession.find_by("name like ?", "%#{params[:profession]}%")
				country = Country.find_by("name like ?", "%#{params[:country]}%")
				profession = Profession.find_by("name like ?", "%#{params[:profession]}%")
				province_list = Country.find_by(name: "#{country.name}").provinces
				cities_list=[]

				province_list.each do |province|
					cities_list << City.where(province_id: province.id)
				end

				user_array=[]
				cities_list.each do |city_list_province|
					city_list_province.each do |city|
						user_array << User.where(city_id: city.id, profession_id: profession.id)
					end
				end
				render json: User.api_return_professionals_by_country(user_array, country.name)
			else 
				render json: {status: 'invalid search query', code: 400}
			end
		end

	end

	def show
		#http://localhost:3000/api/v1/professionals/bob@finance || 
		query = params[:id]
		if query.count(' ') > 0
			name = query.split(' ')
			if name.count == 2
				if User.find_by(first_name: name[0].capitalize, last_name: name[1].capitalize)
					render json: User.api_return_professional(User.find_by(first_name: name[0].capitalize, last_name: name[1].capitalize))
				else 
					render json: {status: 'not found', code: 404}
				end
			else 
				render json: {status: 'invalid search query', code: 400}
			end
		else 
			if User.find_by(first_name: query.capitalize)
				render json: User.api_return_professional(User.find_by(first_name: query.capitalize))
			elsif User.find_by(last_name: query.capitalize)
				render json: User.api_return_professional(User.find_by(last_name: query.capitalize))
			elsif User.find_by("email like ?", "%#{query}%")
				usr = User.find_by("email like ?", "%#{query}%")
				render json: User.api_return_professional(usr)
			else 
				render json: {status: 'not found', code: 404}
			end
		end
	end

	private

	def index_params
		params.require(:professional).permit(:country, :city, :profession)
	end
end
