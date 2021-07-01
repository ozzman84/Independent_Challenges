require './lib/classroom'

RSpec.describe Classroom do
  it 'exists & has atttribtes' do
    classroom = Classroom.new('History', 4)

    expect(classroom).to be_a(Classroom)
    expect(classroom.subject).to eq("History")
    expect(classroom.capacity).to eq(4)
    expect(classroom.students).to eq([])
  end
end
