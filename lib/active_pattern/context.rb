module ActivePattern
  module Context
    def self.[](context_class)
      Module.new do
        @@context_class = context_class
        context_class.prepend(ActivePattern::Comparator)

        def pattern(&pattern_proc)
          PatternObject.new(@@context_class, pattern_proc)
        end
      end
    end
  end
end
