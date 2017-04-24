module CartEngine
  RSpec.describe AddToCart do
    let(:order) { create :cart_engine_order, :with_items }
    let(:item) { order.order_items.first }
    let(:product_id) { item.productable.id }
    let(:params) { { product_id: product_id, quantity: 2 } }
    let(:invalid_params) { { product_id: nil, quantity: 'fdfd' } }

    context '#call' do
      subject { AddToCart.new(order, params) }  
    
      it 'valid broadcast' do
        expect { subject.call }.to broadcast(:valid)
      end
    
      it 'invalid broadcast' do
        subject = AddToCart.new(order, invalid_params)
        expect { subject.call }.to broadcast(:invalid)
      end
    end 
  end
end