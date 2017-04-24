module CartEngine
  RSpec.describe Checkout::DeliveryStep do
    let(:order) { create :cart_engine_order, :with_items }
    let(:shipping) { create :cart_engine_shipping }
    let(:params) { { shipping_id: shipping.id } }
    let(:invalid_params) { { shipping_id: 'dfdf' } }
  
    describe '#call' do
      subject { Checkout::DeliveryStep.new(order, params) }

      context 'valid' do
        it ':valid broadcast' do
          expect { subject.call }.to broadcast(:valid)
       end
        it 'update order' do
          expect { subject.call }.to change(order, :shipping).from(nil)
        end
      end
   
      context 'invalid' do 
        subject { Checkout::DeliveryStep.new(order, invalid_params) }
    
        it ':invalid broadcast' do
          expect { subject.call }.to broadcast(:invalid)
        end
      end
    end
  end
end