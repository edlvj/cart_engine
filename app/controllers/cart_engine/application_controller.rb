module CartEngine
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_order
    
    def checkout_login
      send("authenticate_user") if respond_to?("authenticate_user")
    end  
    
    def current_user
      send("current_user") if respond_to?("current_user")
    end
    
    def current_order
      @current_order ||= set_current_order
    end
    
    protected
    
    def set_current_order
      order = Order.find_by(id: session[:order_id], aasm_state: :in_progress)
      order ||= Order.create
      order = current_user.order_in_processing.set_order!(order) if respond_to?(current_user)
      session[:order_id] = order.id
      order
    end
  end
end
