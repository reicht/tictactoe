class Game
  def initialize
    system('clear')
    line_bar(3)
    @player_symbol = "@"
    user_check
    main_menu
  end

  def user_check
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

  def main_menu
    system ('clear')
    line_bar
    puts "   Welcome back " + @playername + "!"
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
      @placement_chart[x] = false
    end
    game_play
  end

  def game_play
    game_prompt
    player_turn
  end

  def player_turn
    game_prompt
    puts "Currently " + @playername + "'s turn.'"
    line_bar
    puts "Which space would you like to claim? (1 - 9)"
    move = get_response.to_i
    if move == 1
      @plot_one = "  " + @player_symbol + "  "
    elsif move == 2
      @plot_two = "  " + @player_symbol + "  "
    elsif move == 3
      @plot_three = "  " + @player_symbol + "  "
    elsif move == 4
      @plot_four = "  " + @player_symbol + "  "
    elsif move == 5
      @plot_five = "  " + @player_symbol + "  "
    elsif move == 6
      @plot_six = "  " + @player_symbol + "  "
    elsif move == 7
      @plot_seven = "  " + @player_symbol + "  "
    elsif move == 8
      @plot_eight = "  " + @player_symbol + "  "
    elsif move == 9
      @plot_nine = "  " + @player_symbol + "  "
    end
    computer_turn
  end

  def computer_turn
    game_prompt
    puts "Currently Computer's turn.'"
    line_bar
    puts "Anything to continue"
    move = rand(1..9)
    case move
    when 1
      @plot_one = "  " + "$" + "  "
    when 2
      @plot_two = "  " + "$" + "  "
    when 3
      @plot_three = "  " + "$" + "  "
    when 4
      @plot_four = "  " + "$" + "  "
    when 5
      @plot_five = "  " + "$" + "  "
    when 6
      @plot_six = "  " + "$" + "  "
    when 7
      @plot_seven = "  " + "$" + "  "
    when 8
      @plot_eight = "  " + "$" + "  "
    when 9
      @plot_nine = "  " + "$" + "  "
    end
    player_turn
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

  def initialize

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
end

Game.new
