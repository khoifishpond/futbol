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
      @stat_tracker = StatTracker.new
    end
    
    it 'exists' do
      expect(@stat_tracker).to be_a(StatTracker)
    end
  end
end
