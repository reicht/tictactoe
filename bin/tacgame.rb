require_relative '../lib/player.rb'
require_relative '../lib/screens.rb'

class Game
  def initialize
    system('clear')
    @screener = Screens.new
    line_bar(3)
    @player_symbol = "@"
    @host = Player.new("playerone")
    @turn_marker = 1
    main_menu
  end
  def main_menu
    @screener.main_menu(@host.playername)
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
      options_menu
    else
      exit
    end
  end

  def multi_lobby
    @screener.multi_lobby
    if @guest.nil?
      @guest = Player.new("playertwo")
    end
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

  def human_turn(player = 1)
    game_prompt
    if player == 1
      puts "Currently " + @host.playername.to_s + "'s turn.'"
      target = 1
      symbol = @host.symbol
    elsif player == 2
      puts "Currently " + @guest.playername.to_s + "'s turn.'"
      target = -1
      symbol = @guest.symbol
    end
    line_bar
    puts "Which space would you like to claim? (1 - 9)"
    line_bar
    move = get_response.to_i
    if move == 1 && @placement_chart[0] == 0
      @plot_one = "  " + symbol + "  "
      @placement_chart[0] = target
    elsif move == 2 && @placement_chart[1] == 0
      @plot_two = "  " + symbol + "  "
      @placement_chart[1] = target
    elsif move == 3 && @placement_chart[2] == 0
      @plot_three = "  " + symbol + "  "
      @placement_chart[2] = target
    elsif move == 4 && @placement_chart[3] == 0
      @plot_four = "  " + symbol + "  "
      @placement_chart[3] = target
    elsif move == 5 && @placement_chart[4] == 0
      @plot_five = "  " + symbol + "  "
      @placement_chart[4] = target
    elsif move == 6 && @placement_chart[5] == 0
      @plot_six = "  " + symbol + "  "
      @placement_chart[5] = target
    elsif move == 7 && @placement_chart[6] == 0
      @plot_seven = "  " + symbol + "  "
      @placement_chart[6] = target
    elsif move == 8 && @placement_chart[7] == 0
      @plot_eight = "  " + symbol + "  "
      @placement_chart[7] = target
    elsif move == 9 && @placement_chart[8] == 0
      @plot_nine = "  " + symbol + "  "
      @placement_chart[8] = target
    else
      puts "INVALID SELECTION"
      interceptor
      human_turn(@turn_marker)
    end
    if player == 1
      evaluate_board("host")
      if @versus_ai == true
        computer_turn
      else
        @turn_marker += 1
        human_turn(@turn_marker)
      end
    elsif player == 2
      evaluate_board("guest")
      @turn_marker -= 1
      human_turn(@turn_marker)
    end
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
    human_turn
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
    tie_check
  end

  def tie_check
    taken = 0
    @placement_chart.each do |x|
      if x != 0
        taken += 1
      end
    end
    if taken == 9
      tie_screen
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

  def tie_screen
    @screener.tie_screen
    interceptor
    main_menu
  end

  def victory_screen(winner)
    system ('clear')
    line_bar(3)
    print " " * 12
    if winner == "host"
      print @host.playername
      # @host.increase_score
    elsif winner == "guest"
      print @guest.playername
      # @guest.increase_score
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

  def options_menu
    @screener.options_menu
    response = get_response.to_i
    if response == 1
      @host.identify_user
      @host.load_symbol
    elsif response == 2
      if @guest.nil?
        @guest = Player.new("playertwo")
      else
        @guest.identify_user
        @guest.load_symbol
      end
    end
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
