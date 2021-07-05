require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  before(:each) do
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    @product4 = Product.new(:produce, 'apples', 0.99, '20')
  end

  it 'exists & has attributes' do
    expect(@cart).to be_a(ShoppingCart)
    expect(@cart.name).to eq('King Soopers')
    expect(@cart.capacity).to eq(30)
    expect(@cart.products).to eq([])
  end

  it 'returns products & adds them' do
    @cart.add_product(@product1)
    @cart.add_product(@product2)

    expect(@cart.products).to eq([@product1, @product2])
  end

  it 'returns cart details' do
    expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
  end

    describe 'iteration 3' do
      before(:each) do
        @cart.add_product(@product1)
        @cart.add_product(@product2)
        @cart.add_product(@product3)
      end

    it 'returns total_number_of_products & is_full?' do
      expect(@cart.total_number_of_products).to eq(13)

      expect(@cart.is_full?).to eq(false)

      @cart.add_product(@product4)

      expect(@cart.is_full?).to eq(true)
    end

    it 'returns products_by_category' do
      @cart.add_product(@product4)

      expect(@cart.products_by_category(:paper)).to eq([@product1, @product3])
    end

    it 'returns the percentage_occupied' do
      expect(@cart.percentage_occupied).to eq(43.33)
      @cart.add_product(@product4)

      expect(@cart.sorted_products_by_quantity).to eq([@product3, @product2, @product1, @product4])

      expect(@cart.product_breakdown).to eq({:meat=>[@product2], :paper=> [@product1, @product3], :produce=> [@product4]})
    end
  end
end
