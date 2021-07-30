module Gameable
  def highest_total_score
    all_total_scores.max
  end

  def lowest_total_score
    all_total_scores.min
  end

  def all_total_scores
    @games.map do |game|
      game.away_goals.to_i + game.home_goals.to_i
    end
  end
end