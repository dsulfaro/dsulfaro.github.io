require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { Array.new  }
    fill_non_point_cups
  end

  def place_four_stones(x)
    4.times { @cups[x] << :stone }
  end

  def fill_non_point_cups
    0.upto(5) { |x| place_four_stones(x) }
    7.upto(12) { |x| place_four_stones(x) }
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14
    raise "Invalid starting cup" if start_pos < 1
    true
  end

  def opponent_cup?(cup, current_player_name)
    if cup == 6 && current_player_name == @player1
      return false
    elsif cup == 13 && current_player_name == @player2
      return false
    else
      return true
    end
  end

  def make_move(start_pos, current_player_name)
    #byebug
    # bug here, if start_pos has 1 stone, this will break
    num_moves = @cups[start_pos].length
    @cups[start_pos] = []
    cup_to_place_stone = start_pos + 1
    while num_moves > 0
      if cup_to_place_stone == 6 || cup_to_place_stone == 13
        if opponent_cup?(cup_to_place_stone, current_player_name)
          cup_to_place_stone = (cup_to_place_stone + 1) % 14
          next
        end
        @cups[cup_to_place_stone] << :stone
      else
        @cups[cup_to_place_stone] << :stone
      end
      cup_to_place_stone = (cup_to_place_stone + 1) % 14
      num_moves -= 1
    end
    render
    next_turn(cup_to_place_stone - 1)
  end

  def next_turn(ending_cup_idx)
    eci = ending_cup_idx
    eci = 13 if ending_cup_idx < 0
    return :switch if @cups[eci].length == 1 && (eci != 6 && eci != 13)
    return :prompt if eci == 13 || eci == 6
    return eci
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).each { |idx| return false if @cups[idx].length > 0}
    return true
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 0
      return :draw
    when -1
      return @player2
    when 1
      return @player1
    end
  end
end
