module CartEngine
  FactoryGirl.define do
    factory :cart_engine_credit_card, class: CartEngine::CreditCard do
      name 'Taras Shevchenko'
      number '204343434343434'
      expiration_date '12/96'
      cvv '123'
        
      trait :invalid do
        name nil
        number nil
      end
    end
  end
end