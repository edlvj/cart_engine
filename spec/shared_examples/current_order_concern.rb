module CartEngine
  shared_examples_for 'current_order' do
    let(:model) { described_class }
    
    subject { build :cart_engine_order }
    
    context '#add_order_item' do
      it 'when order item exist' do
        order_item = create :cart_engine_order_item, order: subject
        expect { subject.add_order_item(order_item.productable.id, 20).save }
          .to change { order_item.reload.qty }.by(20)
      end
      it 'when order item not exist' do
        book = create :engine_product
        expect { subject.add_order_item(book.id).save }
          .to change { OrderItem.count }.by(1)
      end
      it 'when order item quantity is zero' do
        book = create :engine_product
        item = subject.add_order_item(book.id, 0)
        expect(item.id).to be_nil
      end
    end
    
    it '#sub_total' do
      items = create_list :cart_engine_order_item, 2, order: subject
      expect(subject.reload.sub_total).to eq(items.map(&:sub_total).sum)
    end
    
    it '#coupon_total' do
      subject.coupon = build :cart_engine_coupon, discount: 50
      allow(subject).to receive(:sub_total).and_return(100)
      expect(subject.coupon_total).to eq(50)
    end
    
    it '#shipping_total' do
      subject.shipping = build :cart_engine_shipping, costs: 20 
      expect(subject.shipping_total).to eq(20)
    end
    
    it '#total_cost' do
      subject.coupon = build :cart_engine_coupon, discount: 50
      subject.shipping = build :cart_engine_shipping, costs: 20
      allow(subject).to receive(:sub_total).and_return(100)
      expect(subject.total_cost).to eq(70)
    end
  end
end