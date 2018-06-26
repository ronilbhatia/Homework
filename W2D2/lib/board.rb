require 'byebug'
class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..5).each do |i|
      @cups[i] = [:stone, :stone, :stone, :stone]
    end
    (7..12).each do |i|
      @cups[i] = [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(0, 13)
    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos].dup
    # debugger
    cups[start_pos] = []

    i = start_pos
    until stones.empty?
      # debugger
      i += 1
      i -= 14 if i == 14
      next if current_player_name == name1 && i == 13
      next if current_player_name == name2 && i == 6

      cups[i] << stones.shift
    end

    render
    next_turn(i)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    [(0..5), (7..12)].any? { |side| side.all? { |i| cups[i].empty? }}
  end

  def winner
    player1_stones = cups[6].length
    player2_stones = cups[13].length

    return :draw if player1_stones == player2_stones
    return name1 if player1_stones > player2_stones
    return name2 if player2_stones > player1_stones
  end
end
