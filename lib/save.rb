require 'yaml'

require_relative 'dictionary'
require_relative 'game'
require_relative 'terminal'

# Game objects implement game logic on stored data values
# Their values can be saved and loaded at any time
class Game
  include Dictionary
  include Save

  def initialize(data = {word: Word.new(random_word), tries: 6, incorrect_guesses: []})
    @word = data[:word]
    @tries = data[:tries]
    @incorrect_guesses = data[:incorrect_guesses]
    @terminal = Terminal.new

    play
  end

  def play
    until @tries == 0
      @terminal.display(@word, @tries, @incorrect_guesses)
      
      get_input

      break if @word.guessed
    end

    restart_program
  end

  def self.start_program
    puts "[N]ew game"
    puts "[L]oad game"
  
    input = gets.chomp.downcase
  
    if input == 'n'
      Game.new
    elsif input == 'l'
      Game.load
    else
      puts 'Invalid input, please try again'
      Game.start_program
    end
  end

  def self.load
    if File.exist?('save.rb')
      Game.new(YAML.load_file('save.rb'))
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
      puts "You guessed the word! Returning to start screen..."
      sleep(3)
    else
      puts "You almost got it! The word was #{@word.string}. Returning to start screen..."
      sleep(3)
    end

    Game.start_program
  end
end

Game.start_program
