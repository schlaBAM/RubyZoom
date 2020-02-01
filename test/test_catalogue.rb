# frozen_string_literal: true

require 'test_helper'

class TestCatalogue < Minitest::Test
  def setup
    @catalog = Catalogue.new
  end

  def test_attributes
    refute_nil(@catalog.team, 'team cant be nil')
    assert_kind_of(Team, @catalog.team, 'team must be of type Team')

    refute_nil(@catalog.teams, 'teams cant be nil')
    assert_kind_of(Array, @catalog.teams, 'teams must be of type Array')
  end

  def test_best_team
    assert_equal(@catalog.teams[0].to_s, @catalog.best_team)
  end

  def test_teams_from_division
    division = 'Pacific'
    team_count = @catalog.teams_from(division).split("\n").size
    assert_equal(8, team_count, 'there should be 8 teams in the pacific')
  end

  def test_team_total_player_points
    assert_equal(408, @catalog.team_total_player_points, 'total points should equal 408')
  end

  def test_best_player
    assert_equal(@catalog.team.players[0].to_s, @catalog.best_player)
  end

  def test_goalie_stats
    assert_kind_of(Goalie, @catalog.goalie_stats.first)
  end
end
