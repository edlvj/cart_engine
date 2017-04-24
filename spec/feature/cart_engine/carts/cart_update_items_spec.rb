include Support::Forms
module CartEngine
  feature 'User update order item', type: :feature do
    let(:user) { create :engine_user }
    let(:order) { create :cart_engine_order, :with_items, user: user }
    let(:items) { order.order_items }
  
    before do
      allow_any_instance_of(CartsController)
        .to receive(:current_order).and_return(order)
      visit carts_path
    end
  
    scenario 'Update quantity Success' do
      fill_cart_form('cart_coupon_form', items.first.id, 3)
      expect(page).to have_content(I18n.t('flash.success.cart_update'))
    end
      
    scenario 'Delete quantity' do
      first('.close.general-cart-close').click
      expect(page).to have_content(I18n.t('flash.success.book_destroy', title: items.first.productable.title))
    end
  end
end