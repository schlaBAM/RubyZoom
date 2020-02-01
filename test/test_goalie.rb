# frozen_string_literal: true
require 'test_helper'

class TestGoalie < Minitest::Test
  def setup
    @data = YAML.load_file('test/goalie.yml')['markstrom']
    @goalie = Goalie.new(@data['name'], @data['position'], @data['goals'], @data['assists'], @data['wins'],
                         @data['losses'], @data['saves'], @data['shots_against'])
  end

  def test_attributes
    refute_nil(@goalie.name, 'name cant be nil')
    assert_kind_of(String, @goalie.name, 'name must be of type String')

    refute_nil(@goalie.position, 'position cant be nil')
    assert_kind_of(String, @goalie.position, 'position must be of type String')

    refute_nil(@goalie.goals, 'goals cant be nil')
    assert_kind_of(Integer, @goalie.goals, 'goals must be of type Integer')

    refute_nil(@goalie.assists, 'assists cant be nil')
    assert_kind_of(Integer, @goalie.assists, 'assists must be of type Integer')

    refute_nil(@goalie.wins, 'goals cant be nil')
    assert_kind_of(Integer, @goalie.wins, 'wins must be of type Integer')

    refute_nil(@goalie.losses, 'losses cant be nil')
    assert_kind_of(Integer, @goalie.losses, 'losses must be of type Integer')

    refute_nil(@goalie.saves, 'saves cant be nil')
    assert_kind_of(Integer, @goalie.saves, 'saves must be of type Integer')

    refute_nil(@goalie.shots_against, 'shots cant be nil')
    assert_kind_of(Integer, @goalie.shots_against, 'shots must be of type Integer')
  end

  def test_save_stats_accurate
    assert_equal((@goalie.saves.to_f / @goalie.shots_against).round(3), @goalie.save_percentage,
                 "saves/shots against must equal save percentage")
  end

  def test_total_points
    assert_equal(@goalie.total_points, @data['points'])
  end
end
