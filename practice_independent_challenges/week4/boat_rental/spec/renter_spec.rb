require 'renter'

RSpec.describe Renter do
  before do
    @renter = Renter.new("Pat rick Star", "4242424242424242")
  end

  it 'initializes' do
    expect(@renter).to be_a(Renter)
  end

  it 'has attributes' do
    expect(@renter.name).to eq('Pat rick Star')
    expect(@renter.credit_card_number).to eq("4242424242424242")
  end
end