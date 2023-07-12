require 'colorize'

# Terminal objects are created at the start of each game
# They store images and display/update them each round
module Terminal
  LOGO = [
    "\n",
    "  /\\  /\\__ _ _ __   __ _ _ __ ___   __ _ _ __  ",
    " / /_/ / _` | '_ \\ / _` | '_ ` _ \\ / _` | '_ \\ ",
    "/ __  / (_| | | | | (_| | | | | | | (_| | | | |",
    "\\/ /_/ \\__,_|_| |_|\\__, |_| |_| |_|\\__,_|_| |_|",
    "                   |___/                       ",
    "\n",
  ]

  def start_screen
    print_colorized_logo

    "[N]ew game     [L]oad game".chars.each do |char|
      if ['[', ']', 'N', 'L'].include?(char)
        print char.yellow
        sleep(0.06)
      elsif char == ' '
        print char
        sleep(0.05)
      else
        print char
        sleep(0.06)
      end
    end
    puts "\n"
  end

  def display(word, tries, incorrect_guesses)
    puts ["___", "  |"]
    puts body(tries)
    puts "\n"
    word.print_icons
    print "   |   "
    incorrect_guesses.each { |guess| print "#{guess.colorize(:red)} "}
    puts "\n\n"
  end

  private

  def print_colorized_logo
    colors = [:red, :green, :blue, :light_red, :light_green, :light_blue]

    logo = LOGO.map do |row|
      row.chars.map{ |char| char.colorize(colors.sample) }.join('')
    end

    logo.each { |row| puts row.rjust(20); sleep(0.1) }
    
    puts "\n"
  end

  def body(tries)
    case tries
    when 6
      ["  O", " /|\\", " / \\"].map { |string| string.green }
    when 5
      ["  O", " /|\\", " /"].map { |string| string.light_green }
    when 4
      ["  O", " /|\\", " "].map { |string| string.light_yellow }
    when 3
      ["  O", " /| ", " "].map { |string| string.yellow }
    when 2
      ["  O", "  | ", " "].map { |string| string.light_red }
    when 1
      ["  O", " ", " "].map { |string| string.red }
    end
  end
end
