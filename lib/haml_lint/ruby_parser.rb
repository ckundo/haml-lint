require 'astrolabe/builder'
require 'parser/current'

module HamlLint
  # Parser for the Ruby language.
  #
  # This provides a convenient wrapper around the `parser` gem and the
  # `astrolabe` integration to go with it. It is intended to be used for linter
  # checks that require deep inspection of Ruby code.
  module RubyParser
    # Parse the given Ruby source into an abstract syntax tree.
    #
    # @param source [String] Ruby source code
    # @return [Array] syntax tree in the form returned by Parser gem
    def parse_ruby(source)
      builder = ::Astrolabe::Builder.new
      parser = ::Parser::CurrentRuby.new(builder)
      buffer = ::Parser::Source::Buffer.new('(string)')
      buffer.source = source

      parser.reset
      parser.parse(buffer)
    end
  end
end
