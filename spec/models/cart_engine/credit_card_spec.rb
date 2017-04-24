module CartEngine
 RSpec.describe CreditCard, type: :model do
  subject { build :cart_engine_credit_card }

      context 'association' do
        it { should belong_to :user }
        it { should have_many :order }
      end
  end
end