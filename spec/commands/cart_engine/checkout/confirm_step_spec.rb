module CartEngine
  RSpec.describe Checkout::ConfirmStep do
    let(:order) { create :cart_engine_order }
    let(:user) { create :engine_user }
    let(:params) { }
  
    context 'valid' do
      subject { Checkout::ConfirmStep.new(order, params ,user) }
      
      it 'set broadcast' do
        expect { subject.call }.to broadcast(:valid)
      end
      
      it 'change order state' do
        expect { subject.call }.to change(order, :aasm_state).from('in_progress')
          .to('in_queue')
      end
    end
    
    context 'invalid' do
      subject { Checkout::ConfirmStep.new(nil, params, user) }
  
      it 'set broadcast' do
        expect { subject.call }.to broadcast(:invalid)
      end
  
      it 'change order state' do
        expect { subject.call }.not_to change(order, :aasm_state)
      end
    end
  end  
end