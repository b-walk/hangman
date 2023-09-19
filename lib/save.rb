require 'colorize'

module Save
  def save
    if File.exist?('save.yaml')
      overwrite_save
    else
      File.open('save.yaml', 'w') do |file|
        file.write(YAML.dump({ word: @word, tries: @tries, incorrect_guesses: @incorrect_guesses }))
      end
      puts "\n"
      puts 'Game has been saved.'.green
      puts "\n"
    end
  end

  def overwrite_save
    puts "\n"
    puts 'Overwrite existing save? [y/n]'
    puts "\n"

    case gets.chomp.downcase
    when 'y'
      save = File.open('save.yaml', 'w')
      File.open('save.yaml', 'w') do |f|
        f.puts(YAML.dump({ word: @word, tries: @tries, incorrect_guesses: @incorrect_guesses }))
      end
      puts "\n"
      puts 'Game has been saved.'.green
      puts "\n"
    when 'n'
      get_input
    end
  end
end
