FactoryGirl.define do
  factory :cart_engine_order_item, class: CartEngine::OrderItem do
    qty 2
    productable { create :engine_product }
  end
end