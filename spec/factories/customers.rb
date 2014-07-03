# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name "Mindy"
    happiness 1
    tickets 15
    height 36
    nausea 2
  end
end
