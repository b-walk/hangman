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
  attr_reader :image

  BODY = {
    " O",
    "/|\\",
    "/ \\"
  }

  def initialize
    @image = BODY
    @body = [:head, :torso, :left_arm, :right_arm, :left_leg, :right_leg]
  end

  def remove
    case @body.last
    when :right_leg
      @image[2] = "/"
    when :left_leg
      @image[2] = " "
    when :right_arm
      @image[1] = "/|"
    when :left_arm
      @image[1] = " |"
    when :torso
      @image[1] = " "
    when :head
      @image[0] = " "
    end
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
