require_relative '../lib/player.rb'

class Game
  def initialize
    system('clear')
    line_bar(3)
    @player_symbol = "@"
    @host = Player.new("playerone")
    @turn_marker = true
    main_menu
  end
  def main_menu
    system ('clear')
    line_bar
    puts "   Welcome back " + @host.playername.to_s + "!"
    line_bar(2)
    puts "        ARE YOU READY FOR TIC TAC TOE?!?!?"
    line_bar(2)
    puts "    1 - New Game Versus AI(BETA)"
    line_bar
    puts "    2 - New Game Versus P2(ALPHA)"
    line_bar
    puts "    3 - Show Scoreboard(Inactive)"
    line_bar
    puts "    4 - Player Options(Inactive)"
    line_bar
    puts "    X - E(X)it The Game"
    line_bar
    next_step = get_response.to_i
    if next_step == 1
      @versus_ai = true
      setup_board
    elsif next_step == 2
      @versus_ai = false
      multi_lobby
    elsif next_step == 3
      puts "UNDEVELOPED"
    elsif next_step == 4
      puts "UNDEVELOPED"
    else
      exit
    end
  end

  def multi_lobby
    system ('clear')
    puts
    line_bar(2)
    puts "Entering Multi-Player Mode"
    line_bar
    puts
    puts "Configuring Player Two"
    puts
    line_bar
    puts
    @guest = Player.new("playertwo")
    setup_board
  end

  def setup_board
    @plot_one = "  1  "
    @plot_two = "  2  "
    @plot_three = "  3  "
    @plot_four = "  4  "
    @plot_five = "  5  "
    @plot_six = "  6  "
    @plot_seven = "  7  "
    @plot_eight = "  8  "
    @plot_nine = "  9  "
    @placement_chart = []
    9.times do |x|
      @placement_chart[x] = 0
    end
    human_turn(@turn_marker)
  end

  def human_turn(player)
    game_prompt
    puts "Currently " + @host.playername.to_s + "'s turn.'"
    line_bar
    puts "Which space would you like to claim? (1 - 9)"
    line_bar
    move = get_response.to_i
    if move == 1 && @placement_chart[0] == 0
      @plot_one = "  " + @player_symbol + "  "
      @placement_chart[0] += 1
    elsif move == 2 && @placement_chart[1] == 0
      @plot_two = "  " + @player_symbol + "  "
      @placement_chart[1] += 1
    elsif move == 3 && @placement_chart[2] == 0
      @plot_three = "  " + @player_symbol + "  "
      @placement_chart[2] += 1
    elsif move == 4 && @placement_chart[3] == 0
      @plot_four = "  " + @player_symbol + "  "
      @placement_chart[3] += 1
    elsif move == 5 && @placement_chart[4] == 0
      @plot_five = "  " + @player_symbol + "  "
      @placement_chart[4] += 1
    elsif move == 6 && @placement_chart[5] == 0
      @plot_six = "  " + @player_symbol + "  "
      @placement_chart[5] += 1
    elsif move == 7 && @placement_chart[6] == 0
      @plot_seven = "  " + @player_symbol + "  "
      @placement_chart[6] += 1
    elsif move == 8 && @placement_chart[7] == 0
      @plot_eight = "  " + @player_symbol + "  "
      @placement_chart[7] += 1
    elsif move == 9 && @placement_chart[8] == 0
      @plot_nine = "  " + @player_symbol + "  "
      @placement_chart[8] += 1
    else
      puts "INVALID SELECTION"
      interceptor
      player_turn
    end
    evaluate_board("host")
    computer_turn
  end

  def guest_turn
    game_prompt
    puts "Currently " + @guest.playername.to_s + "'s turn.'"
    line_bar
    puts "Which space would you like to claim? (1 - 9)"
    line_bar
    move = get_response.to_i
    if move == 1 && @placement_chart[0] == 0
      @plot_one = "  " + @player_symbol + "  "
      @placement_chart[0] += -1
    elsif move == 2 && @placement_chart[1] == 0
      @plot_two = "  " + @player_symbol + "  "
      @placement_chart[1] += -1
    elsif move == 3 && @placement_chart[2] == 0
      @plot_three = "  " + @player_symbol + "  "
      @placement_chart[2] += -1
    elsif move == 4 && @placement_chart[3] == 0
      @plot_four = "  " + @player_symbol + "  "
      @placement_chart[3] += -1
    elsif move == 5 && @placement_chart[4] == 0
      @plot_five = "  " + @player_symbol + "  "
      @placement_chart[4] += -1
    elsif move == 6 && @placement_chart[5] == 0
      @plot_six = "  " + @player_symbol + "  "
      @placement_chart[5] += -1
    elsif move == 7 && @placement_chart[6] == 0
      @plot_seven = "  " + @player_symbol + "  "
      @placement_chart[6] += -1
    elsif move == 8 && @placement_chart[7] == 0
      @plot_eight = "  " + @player_symbol + "  "
      @placement_chart[7] += -1
    elsif move == 9 && @placement_chart[8] == 0
      @plot_nine = "  " + @player_symbol + "  "
      @placement_chart[8] += -1
    else
      puts "INVALID SELECTION"
      interceptor
      guest_turn
    end
    evaluate_board("host")
    computer_turn
  end

  def computer_turn
    game_prompt
    puts "Currently Computer's turn.'"
    line_bar
    move = rand(1..9)
    if move == 1 && @placement_chart[0] == 0
      @plot_one = "  " + "$" + "  "
      @placement_chart[0] -= 1
      puts "Computer chooses place " + move.to_s
    elsif move == 2 && @placement_chart[1] == 0
      @plot_two = "  " + "$" + "  "
      @placement_chart[1] -= 1
      puts "Computer chooses place " + move.to_s
    elsif move == 3 && @placement_chart[2] == 0
      @plot_three = "  " + "$" + "  "
      @placement_chart[2] -= 1
      puts "Computer chooses place " + move.to_s
    elsif move == 4 && @placement_chart[3] == 0
      @plot_four = "  " + "$" + "  "
      @placement_chart[3] -= 1
      puts "Computer chooses place " + move.to_s
    elsif move == 5 && @placement_chart[4] == 0
      @plot_five = "  " + "$" + "  "
      @placement_chart[4] -= 1
      puts "Computer chooses place " + move.to_s
    elsif move == 6 && @placement_chart[5] == 0
      @plot_six = "  " + "$" + "  "
      @placement_chart[5] -= 1
      puts "Computer chooses place " + move.to_s
    elsif move == 7 && @placement_chart[6] == 0
      @plot_seven = "  " + "$" + "  "
      @placement_chart[6] -= 1
      puts "Computer chooses place " + move.to_s
    elsif move == 8 && @placement_chart[7] == 0
      @plot_eight = "  " + "$" + "  "
      @placement_chart[7] -= 1
      puts "Computer chooses place " + move.to_s
    elsif move == 9 && @placement_chart[8] == 0
      @plot_nine = "  " + "$" + "  "
      @placement_chart[8] -= 1
      puts "Computer chooses place " + move.to_s
    else
      computer_turn
    end
    line_bar
    interceptor
    evaluate_board("bot")
    host_turn
  end

  def evaluate_board(player)
    if player == "host"
      target = 1
    else
      target = -1
    end
    if @placement_chart[0] == target &&
        @placement_chart[1] == target &&
        @placement_chart[2] == target
        victory_screen(player)

    elsif @placement_chart[3] == target &&
        @placement_chart[4] == target &&
        @placement_chart[5] == target
        victory_screen(player)

    elsif @placement_chart[6] == target &&
        @placement_chart[7] == target &&
        @placement_chart[8] == target
        victory_screen(player)

    elsif @placement_chart[0] == target &&
        @placement_chart[3] == target &&
        @placement_chart[6] == target
        victory_screen(player)

    elsif @placement_chart[1] == target &&
        @placement_chart[4] == target &&
        @placement_chart[7] == target
        victory_screen(player)

    elsif @placement_chart[2] == target &&
        @placement_chart[5] == target &&
        @placement_chart[8] == target
        victory_screen(player)

    elsif @placement_chart[0] == target &&
        @placement_chart[4] == target &&
        @placement_chart[8] == target
        victory_screen(player)

    elsif @placement_chart[2] == target &&
        @placement_chart[4] == target &&
        @placement_chart[6] == target
        victory_screen(player)
    end

  end

  def game_prompt
    system ('clear')
    line_bar(2)
    puts "PLAYING TIC TAC TOE"
    line_bar
    place_space
    print @plot_one
    place_space
    print @plot_two
    place_space
    puts @plot_three
    puts
    place_space
    print @plot_four
    place_space
    print @plot_five
    place_space
    puts @plot_six
    puts
    place_space
    print @plot_seven
    place_space
    print @plot_eight
    place_space
    puts @plot_nine
    puts
    line_bar(2)
  end

  def victory_screen(winner)
    system ('clear')
    line_bar(3)
    print " " * 12
    if winner == "host"
      print @host.playername
    elsif winner == "guest"
      print @guest.playername
    elsif winner == "bot"
      print "Computer"
    else
      print "UNNAMED"
    end
    puts " WINS THE GAME!!!"
    line_bar(4)
    print " " * 6
    puts "LOGGING SCORES AND RETURNING TO MENU"
    line_bar(3)
    interceptor
    main_menu
  end

  def interceptor
    puts "Press enter to continue"
    get_response
  end

  def line_bar(num = 1)
    num.times do
      puts "-" * 50
    end
  end

  def place_space
    print " " * 8
  end

  def get_response(prompt = "")
    print prompt + "   "
    gets.chomp
  end
end


Game.new
