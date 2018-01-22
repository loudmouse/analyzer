
stop_words = %w{the a by on for of are with just but and to the my I has some in} #an array of 'filler words'
lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join

#character count of the text
total_characters = text.length
total_characters_no_spaces = text.gsub(/\s+/, '').length

#counts words, sentences and paragraphs
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

#makes a list of words in the text that are not stop words,
#counts them,
#and gives a percentage of non-stop words (keywords) against all words
words = text.scan(/\w+/)
key_words = words.select{ |word| !stop_words.include?(word)}
percentage_keywords = ((key_words.length.to_f / words.length.to_f) * 100).to_i

#gives us some quality sentences from the from the text
#orders them by length,
#splits them into 3 groups based on length
#looks for the middle third of length
#checks that these sentences include the words 'is' or 'are'
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|\!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

#this is the analysis of the text that's printed out based on the text provided
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_no_spaces} characters without spaces"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} average sentences per paragraph"
puts "#{word_count / sentence_count} average words per sentence"
puts "#{percentage_keywords}% percent of the full text are keywords"

puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
