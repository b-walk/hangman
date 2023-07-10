require_relative 'terminal'
require_relative 'dictionary'

# Game objects will create new sets of game data (e.g. the word, remaining guesses, etc.)
class Game
  include Dictionary

  def initialize
    @tries = 6
    @used_chars = []
  end

  def play
    # loop round (show word, get guess) until player runs out of tries
  end

  private

  def guess
    gets.chomp.downcase
  end
end

# PROGRAM START
# Logo is presented; a new game is initialized
# A random word is chosen for each new game