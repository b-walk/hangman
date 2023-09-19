# Module Dictionary handles word generation from a 1000-word list
module Dictionary
  WORDS = File.readlines('google-10000-english-no-swears.txt').map { |word| word.chomp }
              .select { |word| word.length.between?(5, 12) }

  def random_word
    WORDS.sample
  end
end
