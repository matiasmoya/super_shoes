FactoryGirl.define do
  factory :article do
    store
    sequence :name do |n|
      "Article n#{n}"
    end
    description "A description"
    price 15.50
    total_in_shelf 2
    total_in_vault 3
  end
end
