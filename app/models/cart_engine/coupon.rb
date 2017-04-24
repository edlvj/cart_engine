module CartEngine
  class Coupon < ApplicationRecord
    belongs_to :order, optional: true, class_name: 'CartEngine::Order'
  
    validates :code, presence: true, length: { maximum: 100 }
    validates :discount, presence: true
    validates :discount, numericality: { greater_than_or_equal_to: 0,
                                       less_than_or_equal_to: 100 }
                                       
    def active?
      order.blank?
    end                                   
  end
end
