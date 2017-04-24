FactoryGirl.define do
  factory :cart_engine_address, class: CartEngine::Address do
    firstname 'test'
    lastname 'tests'
    address FFaker::Address.street_name
    city 'New York'
    zipcode 49000
    phone '+380632863823'
    country_id {  create(:cart_engine_country).id }
  end
  
  factory :type_address, parent: :cart_engine_address do
    trait :shipping do
      addressable_type :shipping_address
    end

    trait :billing do
      addressable_type :billing_address
    end
  end
end  