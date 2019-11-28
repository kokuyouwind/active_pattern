require 'active_pattern/context'
require 'active_pattern/pattern_object'
require 'active_pattern/version'

module ActivePattern
  def self.[](context_class)
    Module.new do
      @context_class = context_class

      def self.pattern(&pattern_proc)
        PatternObject.new(@context_class, pattern_proc)
      end
    end
  end
end
