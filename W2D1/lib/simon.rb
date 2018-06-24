class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts "The sequence is the following"
    @seq.each do |color|
      puts color
      sleep(2)
    end
    system("clear")
  end

  def require_sequence
    puts "Please enter the sequence, with each color separated by a space (e.g. Red Blue Yellow)"
    user_seq = gets.chomp.split.map(&:downcase)
    unless user_seq == @seq
      @game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Nice job - that was the correct sequence. Get ready for the next round"
    sleep(2)
    system("clear")
  end

  def game_over_message
    puts "Oh no, you messed up!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    sleep(2)
    puts "Would you like to play again(y/n)"
    input = gets.chomp.downcase
    play if input == 'y'
    puts "Goodbye!" if input == 'n'
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
