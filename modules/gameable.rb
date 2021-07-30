module Gameable
  def highest_total_score
    array_highest_sum_teams_scores = @games.map do |game|
      game.away_goals.to_i + game.home_goals.to_i
    end
    array_highest_sum_teams_scores.max
  end
end