require 'active_pattern/version'

module ActivePattern
  def self.[](context_class)
    Module.new do
      @context_class = context_class

      def self.pattern(&pattern_proc)
        @pattern_proc = pattern_proc
        self
      end

      def self.===(other)
        return false unless @context_class === other
        other.instance_eval(&@pattern_proc)
      end
    end
  end
end
