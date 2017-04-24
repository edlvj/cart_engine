include Support::Forms
module CartEngine
  feature 'User update coupon', type: :feature do
    let(:user) { create :engine_user }
    let(:order) { create :cart_engine_order, :with_items, user: user }
    let(:coupon) { create :cart_engine_coupon }
  
    before do
      allow_any_instance_of(CartsController)
        .to receive(:current_order).and_return(order)
      visit carts_path
    end
    
    scenario 'User fill with valid code' do
      fill_coupon_form('cart_coupon_form', coupon.code)
      expect(page).to have_content(I18n.t('flash.success.cart_update'))
    end
    
    scenario 'User fill with invalid code' do
      fill_coupon_form('cart_coupon_form', 'Code996')
      expect(page).to have_content(I18n.t('flash.failure.cart_update'))
    end  
  end
end