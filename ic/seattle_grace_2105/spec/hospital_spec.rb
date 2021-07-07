require './lib/doctor'
require './lib/hospital'

RSpec.describe Hospital do
  before(:each) do
    @meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})
    # => #<Doctor:0x00007f98a4ba8dc8...>

    @alex = Doctor.new({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", salary: 90_000})
    # => #<Doctor:0x00007f98a4ba8b17...>

    @seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [@meredith, @alex])
    # => #<Hospital:0x00007f83280b3288...>
  end

  it 'exists & has attributes' do
    expect(@seattle_grace).to be_a(Hospital)
    expect(@seattle_grace.name).to eq("Seattle Grace")
    expect(@seattle_grace.chief_of_surgery).to eq("Richard Webber")
    expect(@seattle_grace.doctors).to eq([@meredith, @alex])
  end

  it 'has total_salary' do
    expect(@seattle_grace.total_salary).to eq(190000)
  end

  it 'returns lowest_paid_doctor' do
    expect(@seattle_grace.lowest_paid_doctor).to eq("Alex Karev")
  end

  it 'returns specialties' do
    expect(@seattle_grace.specialties).to eq(["General Surgery", "Pediatric Surgery"])
  end
end
