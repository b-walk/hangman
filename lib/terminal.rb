# Terminal objects are created at the start of each game
# They store images and display/update them each round
class Terminal
  LOGO = [
    "\n",
    "  /\\  /\\__ _ _ __   __ _ _ __ ___   __ _ _ __  ",
    " / /_/ / _` | '_ \\ / _` | '_ ` _ \\ / _` | '_ \\ ",
    "/ __  / (_| | | | | (_| | | | | | | (_| | | | |",
    "\\/ /_/ \\__,_|_| |_|\\__, |_| |_| |_|\\__,_|_| |_|",
    "                   |___/                       ",
    "\n"
  ]

  def initialize
    puts LOGO
  end

  def display(word, tries, incorrect_guesses)
    puts body(tries)
    puts "\n"
    word.print_icons
    print "    |    "
    incorrect_guesses.each { |guess| print "#{guess} "}
    puts "\n"
  end

  private

  def body(tries)
    case tries
    when 6
      [" O", "/|\\", "/ \\"]
    when 5
      [" O", "/|\\", "/"]
    when 4
      [" O", "/|\\", " "]
    when 3
      [" O", "/| "]
    when 2
      [" O", " | "]
    when 1
      " O"
    end
  end
end
