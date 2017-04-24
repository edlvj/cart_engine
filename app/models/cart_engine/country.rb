module CartEngine
  class Country < ApplicationRecord
    has_many :addresses, class_name: 'CartEngine::Address'
  
    validates :name, presence: true
  end
end
