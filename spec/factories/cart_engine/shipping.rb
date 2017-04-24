FactoryGirl.define do
  factory :cart_engine_shipping, class: CartEngine::Shipping do
    company 'tuda-suda'
    costs 10.0
    days 7
  end
end