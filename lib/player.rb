class Player

  attr_accessor :playername, :score, :symbol

  def initialize(slot = "")
    @score = 0
    @playername = ''
    @position = slot
    @symbol = ""
    identify_user
    load_symbol

  end

  def identify_user
    unless File.exist?('../users')
      `mkdir ../users`
    end
    unless File.exist?('../users/' + @position + '.txt')
      `touch ../users/#{@position}.txt`
    end
    @playername = File::read( '../users/'+@position.to_s + '.txt' )
    if @playername == ""
      print "No player detected, please enter name:"
      @playername = get_response
      File::open( '../users/'+@position.to_s + '.txt', 'w' ) do |f|
        f << @playername
      end
    else
      puts "Currently playing as: " + @playername
      line_bar
      puts "Would you like to change the name? (Y)es or (N)o"
      rename = get_response
      if rename.upcase == "Y"
        @playername = get_response("   New Name?")
        File::open( '../users/'+@position.to_s + '.txt', 'w' ) do |f|
          f << @playername
        end
      end
    end
  end

  def load_symbol
    unless File.exist?('../users/' + @position + '_symbol.txt')
      `touch ../users/#{@position}_symbol.txt`
    end
    @symbol = File::read( '../users/'+@position.to_s + '_symbol.txt' )
    if @symbol == ""
      system ('clear')
      line_bar(3)
      puts "No symbol detected for #{@playername}!"
      line_bar
      puts "Please select one of the following symbols"
      puts "You can change it later via options menu"
      line_bar
      puts "1 = !   2 = @   3 = %   4 = 🙊   5 = 🐙"
      puts
      puts "6 = 🐗   7 = ⛄️   8 = 🚀   9 = 🔮"
      line_bar
      choice = get_response("Choose a symbol:").to_i
      if choice == 1
        @symbol = "!"
      elsif choice == 2
        @symbol = "@"
      elsif choice == 3
        @symbol = "%"
      elsif choice == 4
        @symbol = "🙊"
      elsif choice == 5
        @symbol = "🐙"
      elsif choice == 6
        @symbol = "🐗"
      elsif choice == 7
        @symbol = "⛄️"
      elsif choice == 8
        @symbol = "🚀"
      elsif choice == 9
        @symbol = "🔮"
      else
        puts "Please choose one of the options"
        load_symbol
      end
    File::open( '../users/'+@position.to_s + '_symbol.txt', 'w' ) do |f|
      f << @symbol
    end
    else
      puts "Currently using symbol: " + @symbol
      line_bar
      puts "Would you like to update this? (Y)es or (N)o"
      rechoose = get_response
      if rechoose.upcase == "Y"
        @symbol = ''
        File::open( '../users/'+@position.to_s + '_symbol.txt', 'w' ) do |f|
          f << @symbol
          load_symbol
        end
      end
    end
  end

  def increase_score

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
