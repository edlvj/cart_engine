module CartEngine
  RSpec.describe OrderItem, :cart_engine_order_item, :type => :model do
    subject(:order_item) { create :cart_engine_order_item }
      context 'association' do
        it { should belong_to(:order) }
      end
      
      context 'validation' do
        it { should validate_presence_of(:qty) }  
      end  
      
      it '#sub_total' do
        subject.productable = create :engine_product, price: 10
        subject.qty = 2
        expect(subject.sub_total).to eq(20)
      end
  end  
end