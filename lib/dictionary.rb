# Module Dictionary handles word generation from a 1000-word list
module Dictionary
  DICTIONARY_FILE = 'google-10000-english-no-swears.txt'

  WORDS = File.readlines(DICTIONARY_FILE).map { |word| word.chomp }
          .select { |word| word.length.between?(5, 12) }

  def random_word
    WORDS.sample
  end
end
