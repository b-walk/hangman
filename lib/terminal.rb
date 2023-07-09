# The Terminal module will contain methods that display text to the terminal
module Terminal
  def logo
    puts "                                               "
    puts "  /\\  /\\__ _ _ __   __ _ _ __ ___   __ _ _ __  "
    puts " / /_/ / _` | '_ \\ / _` | '_ ` _ \\ / _` | '_ \\ "
    puts "/ __  / (_| | | | | (_| | | | | | | (_| | | | |"
    puts "\\/ /_/ \\__,_|_| |_|\\__, |_| |_| |_|\\__,_|_| |_|"
    puts "                   |___/                       "
    puts "                                               "
  end
end

#test
include Terminal
logo()
