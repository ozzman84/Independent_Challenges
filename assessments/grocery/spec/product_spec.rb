require './lib/product'

RSpec.describe Product do
  before(:each) do
    @product = Product.new(:paper, 'toilet paper', 3.70, '10')
  end

  it 'exists & has attributes' do
    expect(@product).to be_a(Product)
    expect(@product.category).to eq(:paper)
    expect(@product.name).to eq('toilet paper')
    expect(@product.unit_price).to eq(3.70)
    expect(@product.quantity).to eq(10)
  end

  it 'returns total price' do
    expect(@product.total_price).to eq(37.0)
  end

  it 'returns & adds horded' do
    expect(@product.is_hoarded?).to eq(false)

    @product.hoard

    expect(@product.is_hoarded?).to eq(true)
  end
end
