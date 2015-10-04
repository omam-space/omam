FactoryGirl.define do
  factory :volume do
    label Faker::Lorem.word
    address "/tmp/" + Faker::Lorem.word
  end

end
