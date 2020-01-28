
class Team
  attr_reader :name, :division
  attr_accessor :arena, :current_record, :standings_position

  def initialize (name, arena, division, record, position)
    @name = name
    @arena = arena
    @division = division
    @current_record = record
    @standings_position = position
  end

  def relocate_arena(new_location)
    @arena = new_location
  end

end
