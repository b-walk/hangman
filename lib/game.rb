require_relative 'dictionary'

# Letter objects track the visibility states of letters
class Letter
  attr_writer :visible

  def initialize(chr)
    @chr = chr
    @visible = false
  end

  def check(chr)
    if @chr == chr
      @visible = true
    end
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
    @string = random_word
    @word = @string.split('').map { |chr| Letter.new(chr) }
    @guesses_remaining = 6
    @used_letters = []
  end

  def play
    until @guesses_remaining == 0
      print 'Word: '
      @word.each { |letter| print "#{letter.display} "}
      puts "Guess a letter:"
      puts "Guesses remaining: #{@guesses_remaining}"
      guess(gets.chomp.downcase)
      @guesses_remaining -= 1
    end
    puts "The word was #{@string}!"
  end

  private

  def guess(chr)
    @word.each { |letter| letter.check(chr) }
  end
end

# tests
game = Game.new
game.play
