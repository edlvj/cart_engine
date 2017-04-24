module CartEngine
  class Address < ApplicationRecord
    belongs_to :country, class_name: 'CartEngine::Country'
  end
end
