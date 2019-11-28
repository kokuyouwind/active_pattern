module ActivePattern
  module Comparator
    def deconstruct
      matches = $_ACTIVE_PATTERN_MATCHES
      $_ACTIVE_PATTERN_MATCHES = nil
      return matches if matches.is_a?(Array)

      defined?(super) ? super : nil
    end
  end
end
