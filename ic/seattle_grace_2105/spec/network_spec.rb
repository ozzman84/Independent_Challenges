require './lib/doctor'
require './lib/hospital'
require './lib/network'

RSpec.describe Network do
  before(:each) do
    @gsmn = Network.new("Greater Seattle Medical Network")
  end

  it 'exists & has attributes' do
    expect(@gsmn).to be_a(Network)
    expect(@gsmn.name).to eq("Greater Seattle Medical Network")
    expect(@gsmn.hospitals).to eq([])
  end

  describe 'instantiate hospitals & doctors' do
    before(:each) do
      @meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})
      @alex = Doctor.new({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", salary: 90_000})
      @seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [@meredith, @alex])
      @miranda = Doctor.new({name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", salary: 150_000})
      @derek = Doctor.new({name: "Derek Sheperd", specialty: "Neurosurgery", education: "University of Pennsylvania", salary: 125_000})
      @grey_sloan = Hospital.new("Grey Sloan Memorial", "Larry Maxwell", [@miranda, @derek])
      @gsmn.add_hospital(@seattle_grace)
      @gsmn.add_hospital(@grey_sloan)
    end

    it 'returns hospitals' do
      expect(@gsmn.hospitals).to eq([@seattle_grace, @grey_sloan])
    end

    it 'returns highest_paid_doctor' do
      expect(@gsmn.highest_paid_doctor).to eq(@miranda)
    end

    it 'returns doctors_by_hospital' do
      expect(@gsmn.doctors_by_hospital).to eq({
        @seattle_grace => ["Meredith Grey", "Alex Karev"],
        @grey_sloan    => ["Miranda Bailey", "Derek Sheperd"]
      })
    end

    it 'returns doctors_by_specialty' do
      expect(@gsmn.doctors_by_specialty).to eq({
        "General Surgery" => ["Meredith Grey", "Miranda Bailey"],
        "Pediatric Surgery" => ["Alex Karev"],
        "Neurosurgery" => ["Derek Sheperd"]
      })
    end

    it 'returns average_doctors_salary' do
      expect(@gsmn.average_doctors_salary).to eq(116250.00)
    end
  end
end
