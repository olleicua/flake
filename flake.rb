# learn sentence structure
PARTS_OF_SPEECH = %w~ adjectives nouns adverbs verbs prepositions ~
LITERARY_FORM = %w~ adjectives nouns adverbs verbs prepositions adjectives nouns ~
class String
  def to_sentence
    "#{self[0].upcase}#{self[1..-1]}."
  end
end

# learn some words
WORDS = {}
PARTS_OF_SPEECH.each do |x|
  WORDS[x] = open("#{File.dirname(__FILE__)}/#{x}").map(&:chomp)
end

# justify existence
puts "Sometimes when I feel like just another cog in the machine "\
     "I like to say a sentence that nobody has ever said before so I can "\
     "feel like a unique snowflake.\n\n"

# change the state of the universe
puts LITERARY_FORM.map { |x| WORDS[x].sample }.join(' ').to_sentence
