require_relative 'dictionary'

# Letter objects track the visibility states of letters
class Letter
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
  include Dictionary

  def initialize
    @string = random_word
    @word = @string.split('').map { |chr| Letter.new(chr) }
    @guesses_remaining = 6
    @used_letters = []
  end

  def play
    until @guesses_remaining == 0
      @word.each { |letter| print "#{letter.display} " }
      puts "\n\n"
      puts "Guesses remaining: #{@guesses_remaining}"
      puts "\n\n"
      guess()
      @guesses_remaining -= 1
    end
    puts "The word was #{@string}!"
  end

  private

  def guess
    puts 'Guess a letter:'
    chr = gets.chomp.downcase
    unless @used_letters.include?(chr)
      @word.each { |letter| letter.check(chr) }
      @used_letters << chr
    else
      puts "#{chr} has already been guessed."
      guess
    end
  end
end

# tests
game = Game.new
game.play
