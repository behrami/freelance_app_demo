FactoryBot.define do
	factory :user do
		first_name {Faker::Name.name}
		last_name {Faker::Name.last_name}
		email {"#{first_name}@email.com"}
		profession_id {(FactoryBot.create(:profession)).id}
		city_id {(FactoryBot.create(:city)).id}
	end
end