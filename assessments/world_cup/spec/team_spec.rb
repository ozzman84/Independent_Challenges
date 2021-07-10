require './lib/team'
require './lib/player'

RSpec.describe Team do
  before(:each) do
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    # => #<Player:0x00007fe0d02bd280...>
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    # => #<Player:0x00007fe0d0851138...>
    @team = Team.new("France")
    # => #<Team:0x00007fe0d0335d48...>
  end

  it 'exists & has attributes' do
    expect(@team).to be_a(Team)
    expect(@team.country).to eq("France")
  end

  it 'returns eliminated status' do
    expect(@team.eliminated?).to eq(false)
    @team.eliminated
    expect(@team.eliminated?).to eq(true)

  end

  it 'returns & adds players' do
    expect(@team.players).to eq([])

    @team.add_player(@mbappe)

    @team.add_player(@pogba)

    expect(@team.players).to eq([@mbappe, @pogba])

    expect(@team.players_by_position("midfielder")).to eq([@pogba])
    expect(@team.players_by_position("defender")).to eq([])
  end
end
