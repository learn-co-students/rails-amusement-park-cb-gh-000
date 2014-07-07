# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Mindy"
    happiness 1
    tickets 15
    height 36
    nausea 2
  end
  factory :admin, :class => User do
    name "Walt Disney"
    admin true
  end
end
