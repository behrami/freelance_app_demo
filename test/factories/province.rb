FactoryBot.define do
	factory :province do
		name {'Ontario'}
		country_id {FactoryBot.create(:country).id}
	end
end