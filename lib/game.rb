require_relative 'dictionary'

# Letter objects track the visibility states of letters
class Letter
  attr_writer :visible

  def initialize(chr)
    @chr = chr
    @visible = false
  end

  def display
    if @visible
      @chr
    else
      '_'
    end
  end
end

# Word objects will contain random strings pulled from google-10000-english-no-swears.txt
class Word
  def initialize(string)
    @string = string
    @letters = @string.split('').map { |letter| Letter.new(letter) }
  end

  def display
    @letters.each { |letter| print "#{letter.display} "}
  end
end

# Game objects will create new sets of game data (e.g. the word, remaining guesses, etc.)
class Game
  attr_reader :word, :guesses_remaining, :used_letters

  include Dictionary

  def initialize
    @word = random_word
    @guesses_remaining = 6
    @used_letters = []
  end
end

# tests
game = Game.new