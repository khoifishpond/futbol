require './lib/stat_tracker'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe StatTracker do
  context 'Attributes' do
    before(:all) do
      game_path = './data/games.csv'
      team_path = './data/teams.csv'
      game_teams_path = './data/game_teams.csv'
      locations = {
        games: game_path,
        teams: team_path,
        game_teams: game_teams_path
      }
      @stat_tracker ||= StatTracker.from_csv(locations)
    end
    
    it 'exists' do
      expect(@stat_tracker).to be_a(StatTracker)
    end

    it 'has games' do
      expect(@stat_tracker.games.all? { |game| game.class == Game }).to eq(true)
    end

    it 'has teams' do
      expect(@stat_tracker.teams.all? { |team| team.class == Team }).to eq(true)
    end

    it 'has game teams' do
      expect(@stat_tracker.game_teams.all? { |game_team| game_team.class == GameTeam }).to eq(true)
    end
  end

  context 'Calculations' do
    before(:all) do
      game_path = './data/games.csv'
      team_path = './data/teams.csv'
      game_teams_path = './data/game_teams.csv'
      locations = {
        games: game_path,
        teams: team_path,
        game_teams: game_teams_path
      }
      @stat_tracker ||= StatTracker.from_csv(locations)
    end

    it "highest sum of winning and losing teams' scores" do
      expect(@stat_tracker.highest_total_score).to eq(11)
    end

    it "lowest sum of winning and losing teams' scores" do
      expect(@stat_tracker.lowest_total_score).to eq(0)
    end

    it "all sums of winning and losing teams' scores" do
      expect(@stat_tracker.array_all_total_scores).to be_a(Array)
      expect(@stat_tracker.array_all_total_scores.all? { |score| score.class == Integer }).to eq(true)
    end

    it 'percentage of games that a home team has won' do
      expect(@stat_tracker.percentage_home_wins).to eq(0.44)
    end

    it 'percentage of games that an away team has won' do
      expect(@stat_tracker.percentage_visitor_wins).to eq(0.36)
    end

    it 'percentage of games that resulted in a tie' do
      expect(@stat_tracker.percentage_ties).to eq(0.2)
    end

    it 'counts games by season' do
      expect(@stat_tracker.count_of_games_by_season).to eq(
        {
          "20122013"=>806,
          "20162017"=>1317,
          "20142015"=>1319,
          "20152016"=>1321,
          "20132014"=>1323,
          "20172018"=>1355
        }
      )
    end

    it 'average total goals per game across all seasons' do
      expect(@stat_tracker.average_goals_per_game).to eq(4.22)
    end

    it 'average total goals per season' do
      expect(@stat_tracker.average_goals_by_season).to eq(
        {
          "20122013"=>4.12,
          "20162017"=>4.23,
          "20142015"=>4.14,
          "20152016"=>4.16,
          "20132014"=>4.19,
          "20172018"=>4.44
        }
      )
    end

    it 'total number of teams' do
      expect(@stat_tracker.count_of_teams).to eq(32)
    end

    it 'team with highest average of goals scored per game all seasons' do
      expect(@stat_tracker.best_offense).to eq("Reign FC")
    end

    it 'team with the lowest average of goals scored per game all seasons' do
      expect(@stat_tracker.worst_offense).to eq("Utah Royals FC")
    end

    it 'home team with the highest average score per game all seasons' do
      expect(@stat_tracker.highest_scoring_home_team).to eq("Reign FC")
    end

    it 'visitor with the highest average score per game all seasons' do
      expect(@stat_tracker.highest_scoring_visitor).to eq("FC Dallas")
    end
  end
end
