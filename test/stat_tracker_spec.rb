require './lib/stat_tracker'
require 'rspec'
require 'simplecov'
SimpleCov.start

describe StatTracker do
  context 'Attributes' do
    before(:each) do
      @game_path = './data/games.csv'
      @team_path = './data/teams.csv'
      @game_teams_path = './data/game_teams.csv'
      @locations = {
        games: @game_path,
        teams: @team_path,
        game_teams: @game_teams_path
      }
      @stat_tracker ||= StatTracker.from_csv(@locations)
    end
    
    it 'exists' do
      expect(@stat_tracker).to be_a(StatTracker)
    end

    it 'has games' do
      expect(@stat_tracker.games.all? { |game| game.class == Game }).to eq(true)
    end

    it 'has games' do
      expect(@stat_tracker.games.all? { |game| game.class == Game }).to eq(true)
      expect(@stat_tracker.teams.all? { |team| team.class == Game }).to eq(true)
    end
  end
end
