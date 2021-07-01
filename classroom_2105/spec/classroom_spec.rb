require './lib/classroom'

RSpec.describe Classroom do
  before(:each) do
    @classroom = Classroom.new('History', 4)
  end

  it 'exists & has atttribtes' do
    expect(@classroom).to be_a(Classroom)
    expect(@classroom.subject).to eq("History")
    expect(@classroom.capacity).to eq(4)
    expect(@classroom.students).to eq([])
  end

  it 'returns students & yell_at_students' do
    @classroom.add_student('Mike')
    @classroom.add_student('Megan')
    @classroom.add_student('Ian')

    expect(@classroom.students).to eq(["Mike", "Megan", "Ian"])
    expect(@classroom.yell_at_students).to eq(["MIKE", "MEGAN", "IAN"])
  end
end
