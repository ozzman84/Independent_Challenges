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

  it 'returns over_capacity' do
    @classroom.add_student('Mike')
    @classroom.add_student('Megan')
    @classroom.add_student('Bob')

    expect(@classroom.over_capacity?).to eq(false)

    @classroom.add_student('Eve')
    @classroom.add_student('Alice')

    expect(@classroom.over_capacity?).to eq(true)
  end

  it 'can kick_out students' do
    @classroom.add_student('Mike')
    @classroom.add_student('Megan')
    @classroom.add_student('Bob')
    @classroom.add_student('James')
    @classroom.add_student('Cat')
    @classroom.add_student('Alice')

    @classroom.kick_out

    expect(@classroom.over_capacity?).to eq(true)

    @classroom.kick_out

    expect(@classroom.over_capacity?).to eq(false)

    expect(@classroom.students).to eq(["Bob", "James", "Cat", "Alice"])
  end
end
