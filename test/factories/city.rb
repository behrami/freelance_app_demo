FactoryBot.define do
	factory :city do
		name {'Toronto'}
		province_id {(FactoryBot.create(:province)).id}
	end
end