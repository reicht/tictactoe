class Game
  def initialize
    system('clear')
    line_bar(3)
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
    puts "    1 - New Game Versus AI(Inactive)"
    line_bar
    puts "    2 - New Game Versus P2(Inactive)"
    line_bar
    puts "    3 - Show Scoreboard"
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
    end
  end

  def setup_board
    line_one = "  1  "
    line_two = "  2  "
    line_three = "  3  "
    line_four = "  4  "
    line_five = "  5  "
    line_six = "  6  "
    line_seven = "  7  "
    line_eight = "  8  "
    line_nine = "  9  "
    puts line_one
    puts line_two
    puts line_three
    puts line_four
    puts line_five
    puts line_six
    puts line_seven
    puts line_eight
    puts line_nine
  end

  def line_bar(num = 1)
    num.times do
      puts "-" * 50
    end
  end

  def get_response(prompt = "")
    print prompt + "   "
    gets.chomp
  end
end

class Player
  attr_accessor
  def initialize(name)

  end
end

Game.new
