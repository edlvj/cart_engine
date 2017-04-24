module CartEngine
  class CreditCard < ApplicationRecord
    belongs_to :user, optional: true, class_name: 'EngineUser'
    has_many :order, dependent: :destroy, class_name: 'CartEngine::Order'
  end
end
