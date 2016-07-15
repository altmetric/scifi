require 'engtagger'
require 'json'

tagger = EngTagger.new
tagged = tagger.add_tags(ARGF.read)
noun_phrases = tagger.get_noun_phrases(tagged)
proper_nouns = tagger.get_proper_nouns(tagged)
adjectives = tagger.get_adjectives(tagged)
singular_nouns = tagger.get_singular_nouns(tagged)
plural_nouns = tagger.get_plural_nouns(tagged)
past_tense_verbs = tagger.get_past_tense_verbs(tagged)

puts JSON.dump(noun_phrases: noun_phrases, proper_nouns: proper_nouns, adjectives: adjectives, singular_nouns: singular_nouns, plural_nouns: plural_nouns, past_tense_verbs: past_tense_verbs)

