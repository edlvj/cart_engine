FactoryGirl.define do
  factory :cart_engine_order, class: CartEngine::Order do
    user_id nil
    
    trait :with_items do
      order_items { create_list(:cart_engine_order_item, 2) }
    end
    
    trait :with_shipping do
      shipping { create :cart_engine_shipping }
    end
    
    trait :with_credit_card do
      credit_card { create :cart_engine_credit_card }
    end
  end
end