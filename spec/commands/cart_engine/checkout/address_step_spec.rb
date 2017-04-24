module CartEngine
  RSpec.describe Checkout::AddressStep do
    describe 'call' do
      let(:order) { create :cart_engine_order }
      let(:user) { create :engine_user }
      let(:params) { { order: { billing_address: attributes_for(:type_address, :billing) }, use_billing: true  } }
      let(:local_params) { { user_id: user.id, order_id: order.id } }
    
      subject { Checkout::AddressStep.new(order, params, user) }
  
      context 'valid' do
        before do
          subject.set_params(params[:order], local_params, params[:use_billing])
          subject.set_addresses(user)
        end
      
        it 'set broadcast valid' do
          expect { subject.call }.to broadcast(:valid)
        end
      end
    
      context 'invalid' do
        before do
          subject.set_params(nil, local_params)
          subject.set_addresses(user)
        end
      
        it 'set broadcast valid' do
          expect { subject.call }.to broadcast(:invalid)
        end
      end
    end  
  end
end