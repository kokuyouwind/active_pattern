module ActivePattern
  class PatternObject
    def initialize(context_class, pattern)
      @context_class = context_class
      @pattern = pattern
    end

    def ===(other)
      return false unless @context_class === other

      match_result = other.instance_eval(&@pattern)
      case match_result
      in Array
        $_ACTIVE_PATTERN_MATCHES = match_result
        true
      else
        $_ACTIVE_PATTERN_MATCHES = nil
        match_result
      end
    end
  end
end
