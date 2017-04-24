module CartEngine
  RSpec.describe CartsController, type: :controller do
    routes { CartEngine::Engine.routes }

    subject { create :cart_engine_order, :with_items }
    let(:order_item) { subject.order_items.first }
    let(:coupon) { create :cart_engine_coupon, code: 'dd' }
    
    before do
      allow(controller).to receive(:current_order).and_return(subject)
    end
    
    describe 'GET #index' do
      it 'assign coupon' do
        allow(Coupon).to receive(:new)
        get :index
      end
    end
    
    describe 'POST #create' do
      let(:productable_id) { order_item.productable.id }
      let(:params) { { product_id: productable_id, quantity: 20 } }  
      
      it 'AddToCart call' do
        allow(controller).to receive(:params).and_return(params)
        expect(AddToCart).to receive(:call).with(subject, params)
        put :create
      end
      
      context 'success call' do
        before do
          stub_const('AddToCart', Support::Command::Valid)
          Support::Command::Valid.block_value = 20
          put :create
        end
        it 'redirect_back' do
          expect(response).to redirect_to(carts_path)
        end
      end
      
      context 'failure call' do
        before do
          stub_const('AddToCart', Support::Command::Invalid)
          Support::Command::Invalid.block_value = 'errors'
          put :create
        end
        it 'alert flash' do
          expect(flash[:alert]).to eq I18n.t('flash.failure.book_add',
                                             errors: 'errors')
        end
        it 'redirect_back' do
          expect(response).to redirect_to(carts_path)
        end
      end
    end 
    
    describe 'PUT #update' do
      let(:params) { { coupon: { code: coupon.code }, order: { id: order_item.id, qty: 3 } } } 
  
      it 'UpdateOrder call' do
        allow(controller).to receive(:params).and_return(params)
        expect(UpdateOrder).to receive(:call).with(subject, params)
        patch :update, params: params
      end
      
      context 'success update' do
        before do
          stub_const('UpdateOrder', Support::Command::Valid)
          put :update, params: params
        end
        it 'redirect to edit user' do
          expect(response).to render_template(:index)
        end
      end
      
      context 'success update to checkout' do
        let(:params) { { to_checkout: true, order: { id: order_item.id, qty: 3 } } }
        
        before do
          stub_const('UpdateOrder', Support::Command::Checkout)
          put :update, params: params
        end
        it 'redirect to checkout' do
          expect(response).to redirect_to(checkout_path(:address))
        end
      end
      
      context 'failure update' do
        before do
          stub_const('UpdateOrder', Support::Command::Invalid)
          Support::Command::Invalid.block_value = coupon
          put :update, params: params
        end
        it 'flash notice' do
          expect(flash[:alert]).to eq(I18n.t('flash.failure.cart_update' ))
        end
        it 'redirect to edit user' do
          expect(response).to render_template(:index)
        end
      end
    end 
    
    describe 'DELETE #destroy' do
      before do
        subject { order.order_items.first }
        allow(OrderItem).to receive(:find).and_return(subject)
      end
      context 'success destroy' do
        before do
          allow(subject).to receive(:destroy).and_return(true)
          allow(order).to receive(:save).and_return(true)
          delete :destroy, params: { id: subject.id }
        end
      end
      
      it 'return 200' do
        expect(response).to have_http_status(200)
      end
    end    
 
  end
end    