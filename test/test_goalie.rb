require 'test_helper'

class TestGoalie < Minitest::Test

  def setup
    @goalie = YAML.load_file('test/goalie.yml')
    @goalie = @goalie['markstrom']
  end

  # test for is an instance of player / is valid match

  def test_valid_shots_against
    assert_kind_of Integer, @goalie['shots_against'], "shots against must be an integer"
  end

  def test_valid_save_percentage
    assert_kind_of Float, @goalie['save_percentage']
  end

  def test_save_stats_accurate
    assert_equal (@goalie['saves'].to_f / @goalie['shots_against']).round(3), @goalie['save_percentage'],
                 "saves/shots against must equal save percentage"
  end

end
