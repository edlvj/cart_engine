module CartEngine
  RSpec.describe Country, :country, :type => :model do
    subject(:country) { create :cart_engine_country }
  
    context 'association' do
      it { should have_many :addresses }
    end
  
    context 'validation' do
      it { should validate_presence_of(:name) }
    end
  end
end