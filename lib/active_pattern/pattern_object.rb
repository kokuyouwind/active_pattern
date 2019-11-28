module ActivePattern
  class PatternObject
    def initialize(context_class, pattern)
      @context_class = context_class
      @pattern = pattern
    end

    def ===(other)
      return false unless @context_class === other
      other.instance_eval(&@pattern)
    end
  end
end
