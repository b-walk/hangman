require 'yaml'

require_relative 'terminal'
require_relative 'dictionary'

# Game objects store values unique to the current game
class Game
  include Dictionary

  def initialize(game_data = {word: random_word, tries: 6, used_guesses: []})
    @game_data = game_data
  end

  def save
    if File.exists?('save.rb')
      puts 'Are you sure you want to overwrite your existing save?'
    YAML.load_file('save.rb')
    YAML.dump(@save_data)
  end
end

# Save contins helper functions for saving Game data
module Save
  def overwrite
    File.re
  end

  def has_save
    File.exists?('save.rb')
  end
  
  def load_game
    Game.new()
  end
end