module CartEngine
  RSpec.describe Address, type: :model do
    subject { build :type_address, :billing }
      
    context 'associations' do
      it { should belong_to(:country) }
    end
  end  
end