# The Terminal module will contain methods that display text to the terminal
module Terminal
  LOGO = [
    "\n",
    "  /\\  /\\__ _ _ __   __ _ _ __ ___   __ _ _ __  ",
    " / /_/ / _` | '_ \\ / _` | '_ ` _ \\ / _` | '_ \\ ",
    "/ __  / (_| | | | | (_| | | | | | | (_| | | | |",
    "\\/ /_/ \\__,_|_| |_|\\__, |_| |_| |_|\\__,_|_| |_|",
    "                   |___/                       ",
    "\n"
  ]
end

class Hangman
  DEFAULT = [
    "\n",
    "         _______",
    "         |     |",
    "         |     O",
    "         |    /|\\",
    "         |    / \\",
    "         |",
    "    _____|_____",
    "\n"
  ]

  def trim

  end
end

class Letter
  def initialize(letter)
    @letter = letter
    @visible = false
  end

  def icon
    if @visible
      @char
    else
      '_'
    end
  end
end

class Word
  def initialize(word)
    @letters = word.chars.map { |letter| Letter.new(letter) }
  end

  def print_icons
    @letters.each { |letter| print "#{letter.icon} " }
  end
end
