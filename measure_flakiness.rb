class Integer
  def humanize
    x = self
    sections = []
    while x > 999
      section = (x % 1000).to_s
      section = "0#{section}" until section.size == 3
      sections << section
      x /= 1000
    end
    sections << x.to_s
    sections.reverse.join(',')
  end
end

PARTS_OF_SPEECH = %w~ adjectives nouns adverbs verbs prepositions ~
FORM = %w~ adjectives nouns adverbs verbs prepositions adjectives nouns ~
WORDS = {}
PARTS_OF_SPEECH.each do |x|
  WORDS[x] = open("#{File.dirname(__FILE__)}/#{x}").map(&:chomp)
end
print FORM.map { |x| "#{WORDS[x].size} #{x}" }.join(' * ')
print ' = '
print FORM.map { |x| WORDS[x].size }.inject { |a, b| a * b }.humanize
puts ' possible sentences'
