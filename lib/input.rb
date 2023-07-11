# Contains various methods that prompt the user to provide input
module Input
  def input(prompt, *valid_inputs)
    puts prompt

    input = gets.chomp.downcase

    if valid_inputs.includes?(input)
      input
    else
      puts 'Invalid input'
      input(valid_inputs)
    end
  end

  def start_screen_selection
    input(['[P]lay', '[L]oad'], 'p', 'l')
  end
end