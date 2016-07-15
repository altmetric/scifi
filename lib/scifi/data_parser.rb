require 'json'

module Scifi
  class DataParser
    attr_reader :file

    def initialize(data_file = 'data/data.json')
      @file = data_file
    end

    def noun_phrases
      @noun_phrases ||= fetch_key('noun_phrases')
    end

    def singular_nouns
      @singular_nouns ||= fetch_key('singular_nouns')
    end

    def plural_nouns
      @plural_nouns ||= fetch_key('plural_nouns')
    end

    def proper_nouns
      @proper_nouns ||= fetch_key('proper_nouns')
    end

    def adjectives
      @adjectives ||= fetch_key('adjectives')
    end

    private

    def fetch_key(key)
      parsed_data.fetch(key, {}).keys
    end

    def parsed_data
      @parsed_data ||= JSON.parse(File.read(file))
    end
  end
end
