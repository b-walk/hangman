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

# Game objects will create new sets of game data (e.g. the word, remaining guesses, etc.)
class Game
  attr_reader :word, :guesses_remaining, :used_letters

  include Dictionary

  def initialize
    @word = random_word.split('').map { |chr| Letter.new(chr) }
    @guesses_remaining = 6
    @used_letters = []
  end

  def guess(letter)
    # has letter been used already?
    # if no, check word for letter and change visibility of matches to true
    # if yes, display error message and repeat method
  end
end

# tests
game = Game.new
puts game.word.string
game.word.display
