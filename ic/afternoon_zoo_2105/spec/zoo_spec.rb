require './lib/animal'
require './lib/zoo'

RSpec.describe Zoo do
  before(:each) do
    @zoo      = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    @animal_1 = Animal.new("Sea Otter", 10, 25)
    @animal_2 = Animal.new("Red Panda", 5, 70)
    @animal_3 = Animal.new("Capybara", 100, 150)
    @animal_4 = Animal.new("Dolphin", 150, 200)
    @animal_5 = Animal.new("Dog", 65, 200)
  end

  it 'exists & has attributes' do
    expect(@zoo).to be_a(Zoo)
    expect(@zoo.street).to eq("2300 Southern Blvd")
    expect(@zoo.city).to eq("Bronx")
    expect(@zoo.state).to eq("NY")
    expect(@zoo.zip_code).to eq("10460")
    expect(@zoo.inventory).to eq([])
  end

  it 'returns an address' do
    expect(@zoo.address).to eq("2300 Southern Blvd Bronx, NY 10460")
  end

  it 'returns animal_count & inventory' do
    expect(@zoo.animal_count).to eq(0)

    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)

    expect(@zoo.inventory).to eq([@animal_1, @animal_2])
    expect(@zoo.animal_count).to eq(2)
  end

  describe 'iteration 3' do
    before(:each) do
      @zoo.add_animal(@animal_1)
      @zoo.add_animal(@animal_2)
      @zoo.add_animal(@animal_3)
      @zoo.add_animal(@animal_4)
    end

    it 'returns animals_older_than' do
      expect(@zoo.animals_older_than(250)).to eq([])
      expect(@zoo.animals_older_than(100)).to eq([@animal_3, @animal_4])
      expect(@zoo.animals_older_than(10)).to eq([@animal_1, @animal_2, @animal_3, @animal_4])
    end

    it 'returns total_weight' do
      expect(@zoo.total_weight_of_animals).to eq(265)
    end

    it 'returns zoo details' do
      expect(@zoo.details).to eq({"total_weight" => 265, "street_address" => "2300 Southern Blvd"})
    end

    it 'returns animals animals_sorted_by_weight' do
      expect(@zoo.animals_sorted_by_weight).to eq([@animal_4,@animal_3,@animal_1,@animal_2])

      @zoo.add_animal(@animal_5)

      expect(@zoo.animal_hash).to eq({
        "C" => [@animal_3],
        "D" => [@animal_4, @animal_5],
        "R" => [@animal_2],
        "S" => [@animal_1]
      })
    end
  end
end
