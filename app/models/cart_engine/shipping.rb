module CartEngine
  class Shipping < ApplicationRecord
    has_many :orders, class_name: 'CartEngine::Order'
  
    validates :company, :costs, :days, presence: true
    validates :costs, :days, numericality: { greater_than: 0 }
  end
end
