class Game
  def initialize
    system('clear')
    line_bar(3)
    @player_symbol = "@"
    @host = Player.new("playerone")
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
      setup_board
    elsif next_step == 2
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
    puts "Second player is currently: "
    puts
    line_bar
    puts
    puts "Change Player 2 name? (Y)es or (N)o"
    rename = get_response("     Change name?")
    if rename.upcase == "N"
      setup_board
    elsif rename.upcase == "Y"
      name = get_response("   New Name?")
      setup_board
    end
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
    game_play
  end

  def game_play
    game_prompt
    player_turn
  end

  def player_turn
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
    evaluate_board
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
    player_turn
  end

  def evaluate_board
    if @placement_chart[0] == 1 &&
        @placement_chart[1] == 1 &&
        @placement_chart[2] == 1
        puts "PLAYER WIN"
        interceptor

    elsif @placement_chart[3] == 1 &&
        @placement_chart[4] == 1 &&
        @placement_chart[5] == 1
        puts "PLAYER WIN"
        interceptor

    elsif @placement_chart[6] == 1 &&
        @placement_chart[7] == 1 &&
        @placement_chart[8] == 1
        puts "PLAYER WIN"
        interceptor

    elsif @placement_chart[0] == 1 &&
        @placement_chart[3] == 1 &&
        @placement_chart[6] == 1
        puts "PLAYER WIN"
        interceptor

    elsif @placement_chart[1] == 1 &&
        @placement_chart[4] == 1 &&
        @placement_chart[7] == 1
        puts "PLAYER WIN"
        interceptor

    elsif @placement_chart[2] == 1 &&
        @placement_chart[5] == 1 &&
        @placement_chart[8] == 1
        puts "PLAYER WIN"
        interceptor

    elsif @placement_chart[0] == 1 &&
        @placement_chart[4] == 1 &&
        @placement_chart[8] == 1
        puts "PLAYER WIN"
        interceptor

    elsif @placement_chart[2] == 1 &&
        @placement_chart[4] == 1 &&
        @placement_chart[6] == 1
        puts "PLAYER WIN"
        interceptor
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

class Player

  attr_accessor :playername, :score, :symbol

  def initialize(name = "")
    @playername = name
    identify_user


  end

  def identify_user
    @playername = ""
    @playername = File::read( "playername.txt" )
    if @playername == ""
      print "No player detected, please enter name:"
      @playername = get_response
      File::open( 'playername.txt', 'w' ) do |f|
        f << @playername
      end
    else
      puts "Currently playing as: " + @playername
      puts "Would you like to change the name? (Y)es or (N)o"
      rename = get_response
      if rename.upcase == "Y"
        @playername = get_response("   New Name?")
        File::open( 'playername.txt', 'w' ) do |f|
          f << @playername
        end
      end
    end
  end

  def get_response(prompt = "")
    print prompt + "   "
    gets.chomp
  end
end

Game.new
