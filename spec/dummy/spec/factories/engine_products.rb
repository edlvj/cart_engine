FactoryGirl.define do
  factory :engine_product do
    title { FFaker::Book.title }
    price 100.00
    image '/uploads/sample.png'
  end
end
