class Game
  attr_accessor :word, :display_word

  DICTIONARY = File.open('google-10000-english-no-swears.txt', 'r').readlines.select { |word| word.length.between?(5, 12) }

  def initialize
    @word = DICTIONARY.sample.chomp.split('')
    @display = Array.new(word.length, '_')
  end

  def play
    6.times do
      print "#{@word}\n"
      print "#{@display}\n"
      puts "Guess a letter:"
      guess = gets.chomp.downcase
      @word.each_with_index do |letter, index|
        if letter == guess
          @display[index] = letter
        end
      end
    end
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
