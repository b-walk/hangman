# Module Dictionary neatly bundles methods related to dictionary file interactions
module Dictionary
  WORDS = File.open('google-10000-english-no-swears.txt', 'r').readlines.map{ |word| word.chomp }
	.select{ |word| word.length.between?(5, 12) }

	def random_word
		WORDS.sample
	end
end