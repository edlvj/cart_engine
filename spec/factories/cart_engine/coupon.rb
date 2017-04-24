FactoryGirl.define do
  factory :cart_engine_coupon, class: CartEngine::Coupon do
    code 'ruby'
    discount 20
  end
  
  trait :used do
    order { create :cart_engine_order }
  end
end