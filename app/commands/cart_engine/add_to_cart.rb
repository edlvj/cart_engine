module CartEngine
  class AddToCart < Rectify::Command
    attr_reader :order, :product_id, :quantity
  
    def initialize(order, params)
      @order = order
      @product_id = params[:product_id]
      @quantity = params[:quantity].to_i
    end

    def call
      if order_item.valid? && order_item.save && order.save
        broadcast :valid, quantity
      else
        broadcast :invalid, item_errors
      end
    end

    private

    def order_item
      @order_item ||= order.add_order_item(product_id, quantity)
    end
    
    def item_errors
      @order_item.errors.full_messages.join('. ') if @order_item.present?
    end
  end  
end    