# frozen_string_literal: true
require 'test_helper'

class TestTeam < Minitest::Test
  def setup
    data = YAML.load_file('test/team.yml')['Team'][0]
    @team = Team.new(data['name'], data['division'], data['record'], data['position'])
  end

  def test_attributes
    refute_nil(@team.name, 'name cant be nil')
    assert_kind_of(String, @team.name, 'name must be of type String')

    refute_nil(@team.division, 'division cant be nil')
    assert_kind_of(String, @team.division, 'division must be of type String')

    refute_nil(@team.record, 'team record cant be nil')
    assert_kind_of(String, @team.record, 'team record must be of type String')

    refute_nil(@team.standings_position, 'standings_position cant be nil')
    assert_kind_of(Integer, @team.standings_position, 'standings_position must be of type Integer')

    refute_empty(@team.players, 'players array cant be empty')
    assert_kind_of(Array, @team.players, 'players must be of type Array')
  end

  def test_generate_players
    refute_empty(@team.generate_players, 'players are not being generated successfully from yml')
  end

  def test_to_s
    assert_equal("#{@team.standings_position} - #{@team.name} (#{@team.record})\n", @team.to_s)
  end

  def test_complete_team
    # Test team for complete, legal roster (12+ forwards, 6+ defense, 1+ goalie, <24 players)
    assert_equal(true, @team.check_roster_size)
  end
end
