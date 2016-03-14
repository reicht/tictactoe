class Screens
  def main_menu(host = "Player")
    system ('clear')
    line_bar
    puts "   Welcome back " + host.to_s + "!"
    line_bar(2)
    puts "        ARE YOU READY FOR TIC TAC TOE?!?!?"
    line_bar(2)
    puts "    1 - New Game Versus AI(Ver 0.95)"
    line_bar
    puts "    2 - New Game Versus P2(Ver 0.95)"
    line_bar
    puts "    3 - Show Scoreboard(INACTIVE)"
    line_bar
    puts "    4 - Game Options(BETA)"
    line_bar
    puts "    X - E(X)it The Game"
    line_bar
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
  end

  def tie_screen
    system ('clear')
    line_bar(2)
    place_space
    puts "TIE GAME - NO MOVES AVAILABLE"
    line_bar(2)
    place_space
    puts "><><><><><><><><><><><><><><><><><><"
    line_bar(2)
    place_space
    puts "RETURNING TO MENU!"
    line_bar
  end

  def options_menu
    system ('clear')
    line_bar(2)
    place_space
    puts "OPTIONS MENU - MODIFY THE GAME"
    line_bar(2)
    place_space
    puts "PLAYER OPTIONS"
    line_bar
    place_space
    puts "1  -  Configure Player One"
    place_space
    puts "         Name and Symbol"
    line_bar
    place_space
    puts "2  -  Configure Player Two"
    place_space
    puts "         Name and Symbol"
    line_bar(2)
    place_space
    puts "3  -  Configure Computer Symbol"
    line_bar
    puts "M  -  Return to (M)enu     X  -  E(X)it Game"
    line_bar
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
