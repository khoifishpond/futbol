require_relative '../lib/games'
require_relative '../lib/teams'
require_relative '../lib/game_teams'

class StatTracker
  include Gameable
  include Teamable
  include GameTeamable

  attr_reader :games, :teams, :game_teams

  def initialize(files)
    @games ||= Game.file(files[:games])
    @teams ||= Team.file(files[:teams])
    @game_teams ||= GameTeam.file(files[:game_teams])
  end

  def self.from_csv(files)
    new(files)
  end