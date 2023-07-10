require_relative 'dictionary'

# Letter objects track the visibility states of letters
class Letter
  attr_writer :visible

  def initialize(chr)
    @chr = chr
    @visible = false
  end

  def check(chr)
    if @chr == chr then @visible = true end
  end

  def display
    if @visible then @chr else '_' end
  end
end

# Game objects will create new sets of game data (e.g. the word, remaining guesses, etc.)
class Game
  include Dictionary

  def initialize
    @string = random_word
    @word = @string.split('').map { |chr| Letter.new(chr) }
    @guesses_remaining = 6
    @used_guesses = []
  end

  def play
    # loop round (show word, get guess) until player runs out of tries
  end

  private

  def guess
    gets.chomp.downcase
  end
end

# tests
game = Game.new
game.play

# PROGRAM START
# Logo is presented; a new game is initialized