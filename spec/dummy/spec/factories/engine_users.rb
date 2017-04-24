FactoryGirl.define do
  factory :engine_user do
    firstname 'test'
    lastname 'tset'
    email { FFaker::Internet.email }
  end
end
