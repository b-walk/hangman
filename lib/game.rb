# Game objects will create new sets of game data (e.g. the word, remaining guesses, etc.)
class Game
  def initialize
    @word = "teststring"
    @guesses_remaining = 6
    @used_letters = []
  end
end