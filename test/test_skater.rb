# frozen_string_literal: true

require 'test_helper'

class TestSkater < Minitest::Test

  def setup
    @data = YAML.load_file('test/skater.yml')['Skater'][0]
    @skater = Skater.new(@data['name'], @data['position'], @data['goals'], @data['assists'], @data['shots'])
  end

  def test_attributes
      refute_nil @skater.name, 'name cant be nil'
      assert_kind_of String, @skater.name, 'name must be of type String'

      refute_nil @skater.position, 'position cant be nil'
      assert_kind_of String, @skater.position, 'position must be of type String'

      refute_nil @skater.goals, 'goals cant be nil'
      assert_kind_of Integer, @skater.goals, 'goals must be of type Integer'

      refute_nil @skater.assists, 'assists cant be nil'
      assert_kind_of Integer, @skater.assists, 'assists must be of type Integer'

      refute_nil @skater.shots, 'shots cant be nil'
      assert_kind_of Integer, @skater.shots, 'shots must be of type Integer'
  end

  def test_total_points
    assert_equal @skater.total_points, @data['points']
  end

  def test_shot_percentage_type
    assert_kind_of Float, @skater.shot_percentage, '#shot_percentage must return a Float'
    assert_equal (@skater.goals.to_f / @skater.shots).round(2) * 100, @skater.shot_percentage
  end

end

