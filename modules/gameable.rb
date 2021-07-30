module Gameable
  def highest_total_score
    array_all_total_scores.max
  end

  def lowest_total_score
    array_all_total_scores.min
  end

  def array_all_total_scores
    @games.map do |game|
      game.away_goals.to_i + game.home_goals.to_i
    end
  end

  def percentage_home_wins
    win_count = hash_hoa_game_teams["home"].count do |game_team|
      game_team.result == "WIN"
    end
    all_games = hash_hoa_game_teams["home"].count do |game_team|
      game_team
    end
    win_count.fdiv(all_games).round(2)
  end

  def percentage_visitor_wins
    win_count = hash_hoa_game_teams["away"].count do |game_team|
      game_team.result == "WIN"
    end
    all_games = hash_hoa_game_teams["away"].count do |game_team|
      game_team
    end
    win_count.fdiv(all_games).round(2)
  end

  def hash_hoa_game_teams
    @game_teams.group_by do |game_team|
      game_team.hoa
    end
  end
end