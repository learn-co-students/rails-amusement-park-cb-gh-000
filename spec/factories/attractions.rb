# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attraction do
    name "Roller Coaster"
    tickets 5
    nausea_rating 2
    happiness_rating 4
    min_height 32
  end
  factory :ferriswheel, :class => Attraction do
    name "Ferris Wheel"
    tickets 3
    nausea_rating 2
    happiness_rating 2
    min_height 28
  end
end
