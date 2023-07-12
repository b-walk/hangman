require 'yaml'

require_relative 'dictionary'
require_relative 'terminal'
require_relative 'word'
require_relative 'save'

# Game objects implement game logic on stored data values
# Their values can be saved and loaded at any time
class Game
  include Dictionary
  include Save
  include Terminal

  def initialize(data = {word: Word.new(random_word), tries: 6, incorrect_guesses: []})
    @word = data[:word]
    @tries = data[:tries]
    @incorrect_guesses = data[:incorrect_guesses]

    play
  end

  def play
    until @tries == 0
      puts "\n\n\n\n"
      display(@word, @tries, @incorrect_guesses)
      
      get_input

      break if @word.guessed
    end

    display(@word, @tries, @incorrect_guesses)

    restart_program
  end

  def self.start_program
    start_screen
  
    input = gets.chomp.downcase
  
    if input == 'n'
      puts "\n\n\n\n"
      Game.new
    elsif input == 'l'
      puts "\n\n\n\n"
      Game.load
    else
      puts "\n\n"
      puts 'Invalid input, please try again'
      Game.start_program
    end
  end

  def self.load
    if File.exist?('save.yaml')
      puts "\n"
      puts "Loading saved game...".light_yellow
      puts "\n"
      sleep(1.5)
      puts "Finished!".light_green
      puts "\n"
      game_data = YAML.load_file('save.yaml', permitted_classes: [Word, Symbol, Letter])
      Game.new(game_data)
    else
      puts "No save data exists. Starting new game..."
      sleep(2)
      Game.start_program
    end
  end

  private

  def get_input
    input = gets.chomp.downcase

    case input
    when 'save'
      save
    when 'load'
      puts "You may load a game after finishing this one."
      get_input
    else
      guess(input)
    end
  end

  def guess(input)
    if @incorrect_guesses.include?(input) || @word.correct_guesses.include?(input)
      puts "#{input} has already been guessed. Try another letter."
      get_input
    elsif %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].include?(input)
      if @word.includes(input)
        @word.find_matches(input)
      else
        @incorrect_guesses << input
        @tries -= 1
      end
    else
      puts "Invalid input, please try again."
      get_input
    end
  end

  def restart_program
    if @tries > 0
      puts "You guessed the word! Returning to start screen...\n\n"
      sleep(3)
    else
      puts "Too bad. The word was #{@word.string}. Returning to start screen...\n\n"
      sleep(3)
    end

    Game.start_program
  end
end

include Terminal

Game.start_program
