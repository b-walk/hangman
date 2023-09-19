class Letter
  attr_accessor :char, :guessed

  def initialize(letter)
    @char = letter
    @guessed = false
  end

  def icon
    if @guessed
      @char
    else
      '_'
    end
  end
end

class Word
  attr_reader :string

  def initialize(word)
    @letters = word.chars.map { |letter| Letter.new(letter) }
    @string = word
    @correct_guesses = []
  end

  def print_icons
    @letters.each { |letter| print "#{letter.icon.light_cyan} " }
  end

  def find_matches(guess)
    @letters.each do |letter|
      letter.guessed = true if letter.char == guess
    end
  end

  def includes(guess)
    @letters.any? { |letter| letter.char == guess }
  end

  def guessed
    @letters.all? { |letter| letter.guessed }
  end

  def correct_guesses
    array = []

    @letters.each do |letter|
      array << letter.char if letter.guessed
    end

    array.uniq
  end
end
