module CartEngine
  class OrderItem < ApplicationRecord
    belongs_to :order, optional: true, class_name: 'CartEngine::Order'
    belongs_to :productable, polymorphic: true
  
    validates :qty, presence: true, numericality: { only_integer: true, greater_than: 0 }
  
    def sub_total
      @sub_total ||= qty * productable.price
    end
  end
end
