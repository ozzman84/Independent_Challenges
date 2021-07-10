class WorldCup
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year  = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.filter_map do |team|
      team.players_by_position(position) if !team.eliminated?
    end.flatten
  end

  def all_players_by_position
    player_list = Hash.new { |h, k| h[k] = [] }
    @teams.each do |team|
      team.players.flat_map do |player|
        player_list[player.position] << player
      end
    end
    player_list
  end
end
