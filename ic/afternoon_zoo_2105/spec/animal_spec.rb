require './lib/animal'

RSpec.describe Animal do
  before(:each) do
    @animal_1 = Animal.new("Sea Otter", 10, 25)
  end

  it 'exists & has attributes' do
    expect(@animal_1).to be_a(Animal)
    expect(@animal_1.kind).to eq("Sea Otter")
    expect(@animal_1.weight).to eq("10 pounds")
    expect(@animal_1.age).to eq("25 weeks")
  end

  it 'can show age_in_days' do
    expect(@animal_1.age_in_days).to eq(175)
  end

  it 'returns weight when fed' do
    @animal_1.feed!(2)

    expect(@animal_1.weight).to eq("12 pounds")

    @animal_1.feed!(1)

    expect(@animal_1.weight).to eq("13 pounds")
  end
end
