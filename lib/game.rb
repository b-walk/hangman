# Word objects will contain random strings pulled from google-10000-english-no-swears.txt
class Word

  DICTIONARY = File.open('google-10000-english-no-swears.txt', 'r').readlines.map{ |word| word.chomp }.
  select{ |word| word.length.between?(5, 12)}

  def initialize
    @string = Word.random
  end

  def self.random
    DICTIONARY.sample
  end
end

# Game objects will create new sets of game data (e.g. the word, remaining guesses, etc.)
class Game
  attr_reader :word, :guesses_remaining, :used_letters

  def initialize
    @word = Word.random
    @guesses_remaining = 6
    @used_letters = []
  end
end

# tests
game = Game.new

puts game.word
puts game.guesses_remaining
