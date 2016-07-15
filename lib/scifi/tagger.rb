module Scifi
  class Tagger
    attr_reader :tagger, :text, :data_parser

    def initialize(text)
      @tagger = EngTagger.new
      @text = text
      @data_parser = DataParser.new
    end

    def noun_phrases
      tagger.get_noun_phrases(tagged_text).keys
    end

    def proper_nouns
      tagger.get_proper_nouns(tagged_text).keys
    end

    def singular_nouns
      tagger.get_singular_nouns(tagged_text).keys
    end

    def plural_nouns
      tagger.get_plural_nouns(tagged_text).keys
    end

    def adjectives
      tagger.get_adjectives(tagged_text).keys
    end

    def replace_all(percentage = 1.0)
      @current_text = text.dup

      replace_text(proper_nouns, data_parser.proper_nouns, percentage)
      replace_text(singular_nouns, data_parser.singular_nouns, percentage)
      replace_text(plural_nouns, data_parser.plural_nouns, percentage)
      replace_text(adjectives, data_parser.adjectives, percentage)

      @current_text
    end

    def tagged_text
      @tagged_text ||= tagger.add_tags(text)
    end

    private

    def replace_text(original, replacements, percentage)
      qty = original.size * percentage

      original.shuffle[0..qty].each do |phrase|
        replacement = replacements.sample

        @current_text.gsub!(/\b#{phrase}\b/, replacement)
      end
    end
  end
end
