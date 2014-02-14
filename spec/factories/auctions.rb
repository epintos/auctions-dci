# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auction do
    status "MyString"
    price "9.99"
    item_id 1
    seller_id 1
    winner_id 1
    end_date "2014-02-14 12:40:29"
    extended_end_date "2014-02-14 12:40:29"
    extendable false
  end
end
