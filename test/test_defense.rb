# frozen_string_literal: true

require 'test_helper'
require 'yaml'

class TestDefense < Minitest::Test

  def setup
    @defense = YAML.load_file('test/defense.yml')
    @defense = @defense['Defense']
  end

  def test_keys
    @defense.each do |player|
      player.keys.each do |key|
        puts "#{key}: #{player[key]}"
        refute player[key].nil?
      end
    end

    @defense[0]['goals'] = nil
    assert @defense[0]['goals'].nil?
  end

def test_has_no_hits
  assert @defense[0]['hits'].nil?
end

  def test_is_skater_defense
    position = @defense[1]['position'].upcase
    assert position == 'LD' || position == 'RD'
  end

  # checks list to ensure team has a LD and RD to make a pair.
  def test_can_make_defense_pair
    pair = %w(LD RD)
    @defense.each do |player|
      pair.delete(player['position'])
    end
    assert pair.empty?
  end

  def test_add_defense

  end

  def test_delete_defense

  end

  def test_update_stats

  end
end

