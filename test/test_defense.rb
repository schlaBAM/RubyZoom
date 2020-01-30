# frozen_string_literal: true

require 'test_helper'

class TestDefense < Minitest::Test

  def setup
    @defense = YAML.load_file('test/defense.yml')
    @defense = @defense['Defense']
  end

  def test_keys
    @defense.each do |player|
      player.keys.each do |key|
        puts "#{key}: #{player[key]}"
        refute_nil player[key]
      end
    end

    @defense[0]['goals'] = nil
    assert_nil @defense[0]['goals']
  end

def test_has_no_hits
  assert_nil @defense[0]['hits']
end

  def test_is_skater_defense
    position = @defense[1]['position'].upcase
    assert_includes %w(LD RD), position
  end

  # checks list to ensure team has a LD and RD to make a pair.
  def test_can_make_defense_pair
    pair = %w(LD RD)
    @defense.each do |player|
      pair.delete(player['position'])
    end
    assert_empty pair
  end

  def test_add_defense

  end

  def test_delete_defense

  end

  def test_update_stats

  end
end

