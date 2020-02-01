# frozen_string_literal: true
class Player
  attr_reader :name, :position
  attr_accessor :goals, :assists

  def initialize(name, position, goals, assists)
    @name = name
    @position = position
    @goals = goals
    @assists = assists
  end

  def total_points
    @goals + @assists
  end

  def to_s
    "#{@name} (#{@goals}G, #{@assists}A, #{total_points}P)\n"
  end
end
