require 'test_helper'

class TestTeam < Minitest::Test

  parallelize_me!

  def setup
    @team = YAML.load_file('test/team.yml')
    @teams = @team['Team']
  end

  def test_attributes_not_nil
    @teams.each do |team|
      team.keys.each do |key|
        refute_nil(team[key])
      end
    end
  end

  #data file not in order.
  def test_teams_sorted_by_position
    refute_equal @teams, @teams.sort_by { |team| team['position'] }
  end

  def test_complete_team
    #Test team for complete roster (12 forwards, 6 defense, 1 goalie)
  end

end
