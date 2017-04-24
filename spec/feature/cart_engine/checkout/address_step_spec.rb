include Support::Forms

module CartEngine
  feature 'Address step', type: :feature do
    let(:user) { create :engine_user }
    let(:billing) { create :type_address, :billing, user: user }
    let(:order) { create :cart_engine_order, :with_items, user: user }
    let(:billing_attrs) { attributes_for :type_address, :billing }
  
    background do
      @shipping = create :cart_engine_shipping
      allow_any_instance_of(CheckoutController)
        .to receive(:current_order).and_return(order)
    end
  
    scenario 'When user have billing address' do
      visit checkout_path(id: :address)
      fill_address_form('billing_address', billing_attrs, true)
      expect(current_path).to eq checkout_path(id: :delivery)
    end
  end 
end