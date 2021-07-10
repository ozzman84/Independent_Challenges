require './lib/team'
require './lib/player'

RSpec.describe Team do
  before(:each) do
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba  = Player.new({name: "Paul Pogba", position: "midfielder"})
    @team   = Team.new("France")
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
