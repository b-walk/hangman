# The Terminal module will contain methods that display text to the terminal
module Terminal
  LOGO = [
    "\n",
    "  /\\  /\\__ _ _ __   __ _ _ __ ___   __ _ _ __  ",
    " / /_/ / _` | '_ \\ / _` | '_ ` _ \\ / _` | '_ \\ ",
    "/ __  / (_| | | | | (_| | | | | | | (_| | | | |",
    "\\/ /_/ \\__,_|_| |_|\\__, |_| |_| |_|\\__,_|_| |_|",
    "                   |___/                       ",
    "\n",
    "       by Blake",
    "\n"
  ]

  def print_logo
    puts LOGO
  end
end

include Terminal

print_logo