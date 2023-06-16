class Display
  attr_accessor :word, :guesses_remaining, :used_guesses, :visible_word

  def initialize(actual_word)
    @actual_word = actual_word
    @visible_word = Array.new(actual_word.length - 1, "_")
    @used_guesses = []
  end

  def update(guess)
    @actual_word.each_with_index do |letter, index|
      if @used_guesses.include?(guess)
        puts "Letter has already been guessed."
      elsif guess == letter
        @visible_word[index] = letter
        @used_guesses << guess
      elsif guess != letter
        puts "Word does not contain this letter."
        @used_guesses << guess
        @guesses_remaining -= 1
      end
    end
    @guesses_remaining
  end
end

class Word
  attr_accessor :letters

  def initialize(string)
    @letters = string.split('')
    @length = string.length
  end
end

class Game
  attr_reader :word

  DICTIONARY = File.open('google-10000-english-no-swears.txt', 'r').readlines.select { |word| word.length.between?(5, 12) }
  puts DICTIONARY.sample

  def initialize
    @word = DICTIONARY.sample
    @guesses_remaining = 6
    @display = Display.new(@word)
  end

  def play
    while @guesses_remaining > 0
      guess
    end
  end

  def guess
    puts "Word: #{@display.visible_word}"
    puts "Guesses remaining: #{@guesses_remaining}"
    puts "Guess a letter:"
    guess = gets.chomp.downcase
    @guesses_remaining = update(guess)
  end
end

game = Game.new
game.play


# GAME FLOW
# A new instance of Game is created
# New Word is generated
# New Display is generated
# An array of underscores the length of the word is created
# A full hangman is created
# Print a greeting message

# REPEAT UNTIL WINNER
# The contents of the Display object are printed to the terminal
# The user inputs a letter
# The letter is checked to see if...:
# It has been guessed already
# It is an invalid character
# If the word contains the user-entered letter, instances of that letter are made visible in the terminal
# If the word does not contain the letter, that letter is displayed in a group to the right of the body

# Game.new is used to start a new game
# A random word is generated at the start of each game
# At the start of each guess sequence, an image of the current hangman and word will be printed, as well as the incorrect letters that have been guessed
# During the guess sequence, the player will input a letter
# If the word contains the letter that was guessed, all of its instances are made visible
