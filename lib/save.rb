module Save
    def save
      if File.exist?('save.yaml')
        overwrite_save
      else
        File.open('save.yaml', 'w') { |file| file.write(YAML.dump({word: @word, tries: @tries, incorrect_guesses: @incorrect_guesses}))}
        puts "Game has been saved."
      end
    end
  
    def overwrite_save
      puts "Overwrite existing save? [y/n]"
  
      case gets.chomp.downcase
      when 'y'
        save = File.open('save.yaml', 'w')
        File.open('save.yaml', 'w') do |f|
          f.puts(YAML.dump({word: @word, tries: @tries, incorrect_guesses: @incorrect_guesses}))
        end
        puts "Game has been saved."
      when 'n'
        get_input
      end
    end
  end