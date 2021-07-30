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
  end
end
