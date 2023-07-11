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

  def initialize(word)
    @body = Body.new
    @word = Word.new(word)
  end

  def refresh(guessed_char, game_data = {})
    @word.reveal_matches()
  end

  def display
    puts @body.image
    puts "\n"
    puts @word
    puts "\n"
  end
end

# Body objects store and change the image of the hanging man
class Body
  attr_reader :image

  BODY = [
    " O",
    "/|\\",
    "/ \\"
  ]

  def initialize
    @image = BODY
    @body = [:head, :torso, :left_arm, :right_arm, :left_leg, :right_leg]
  end

  def remove_part
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

    @body.pop
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

  def reveal_matches(guess)
    @letters.each do |letter|
      if letter.char == guess
        letter.visible = true
      end
    end
  end
end
