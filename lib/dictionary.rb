# Module Dictionary neatly bundles methods related to dictionary file interactions
module Dictionary
  WORDS = File.readlines('google-10000-english-no-swears.txt').map{ |word| word.chomp }
	.select{ |word| word.length.between?(5, 12) }

	def random_word
		WORDS.sample
	end
end

module Save
  def save
    if File.exist?('save.rb')
      overwrite_save
    else
      File.open('save.rb', 'w') { |file| file.write(YAML.dump(game_data_hash))}
      puts "Game has been saved."
    end
  end

  def overwrite_save
    puts "Overwrite existing save? [y/n]"

    case gets.chomp.downcase
    when 'y'
      save = File.open('save.rb', 'w')
      save.rewind.truncate(0).write(YAML.dump(game_data_hash))
      puts "Game has been saved."
    when 'n'
      save_or_guess
    end
  end
end