# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bid do
    auction_id 1
    user_id 1
    amount "9.99"
  end
end
