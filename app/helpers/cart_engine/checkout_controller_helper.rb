module CartEngine
  module CheckoutControllerHelper
    def is_step_active progress
      return "step active" if step == progress
      return "step done" if past_step?(progress)
      "step"
    end

    def is_use_billing?
      session['use_billing']
    end
  
    def edit_link(type)
      link_to I18n.t('checkout.edit'), checkout_path(type)
    end 
  
  end
end
