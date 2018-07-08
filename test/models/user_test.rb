require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test 'create user' do
		user = FactoryBot.create(:user)
		assert(user.first_name)
	end

	test 'create province' do
		province = FactoryBot.create(:province)
		assert(province)
	end

	test 'create profession' do
		profession = FactoryBot.create(:profession)
		assert(profession)
	end

	test 'create country' do
		country = FactoryBot.create(:country)
		assert(country)
	end
	
	test 'create city' do
		city = FactoryBot.create(:city)
		assert(city)
	end

	test 'plumber from toronto' do
		plumber = make_canadian_plumber
		assert_equal('Toronto', City.find(plumber.city_id).name) 
	end
	test '10 plumbers from toronto' do
		plumbers = []
		10.times do 
			plumber = make_canadian_plumber
			plumbers.push(plumber)
		end
		plumbers.each do |plumber|
			assert_equal('Toronto', City.find(plumber.city_id).name) 
		end
	end

	test 'plumbers from scarborough' do
		plumbers = []
		10.times do
			plumber = make_canadian_plumber_from_scarborough
			plumbers.push(plumber)
		end
		plumbers.each do |plumber|
			assert_equal('Scarborough', City.find(plumber.city_id).name) 
		end
		# assert_equal(10, User.where(profession_id: make_canadian_plumber_from_scarborough.id, city_id: make_scarborough.id)) 
	end
	def make_scarborough
		return FactoryBot.create(:city, name: 'Scarborough')
	end

	def make_canadian_plumber
		FactoryBot.create(:province)
		FactoryBot.create(:city)
		FactoryBot.create(:country)
		FactoryBot.create(:profession, name: 'Plumber')
		return FactoryBot.create(:user)
	end 
	def make_canadian_plumber_from_scarborough
		FactoryBot.create(:province)
		scarb = FactoryBot.create(:city, name: 'Scarborough')
		FactoryBot.create(:country)
		FactoryBot.create(:profession, name: 'Plumber')
		return FactoryBot.create(:user, city_id: scarb.id)
	end 
end
