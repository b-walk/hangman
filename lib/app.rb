class Game
  attr_accessor :word, :remaining_guesses

  def initialize
    @word = random_word
  end

  private

  def random_word
    dictionary = File.open('google-10000-english-no-swears.txt', 'r').readlines.select { |word| word.length.between?(5..12) }
    dictionary.sample
  end
end