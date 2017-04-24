module CartEngine
  feature 'User on cart', type: :feature do
    let(:user) { create :engine_user }
    let(:order_empty) { create :cart_engine_order, user: user }
    let(:order_with_items) { create :cart_engine_order, :with_items, user: user }
    let(:item) { order_with_items.order_items.first }
    
    scenario 'When user have order items' do
      allow_any_instance_of(CartsController).to receive(:current_order)
        .and_return(order_with_items)
      visit carts_path
      expect(page).to have_content(I18n.t('cart.cart'))
      expect(page).to have_no_content(I18n.t('cart.no_items'))
      expect(page).to have_content(item.productable.title)
      expect(page).to have_content(item.qty)
      expect(page).to have_content(order_with_items.sub_total)
    end
    
    scenario 'When user have empty cart' do
      allow_any_instance_of(CartsController).to receive(:current_order)
        .and_return(order_empty)
      visit carts_path
      expect(page).to have_content(I18n.t('cart.no_items'))
      expect(page).not_to have_content(I18n.t('cart.update_cart'))
    end
  end  
end