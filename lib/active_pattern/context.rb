module ActivePattern
  module Context
    def self.[](context_class)
      Module.new do
        @@context_class = context_class

        def pattern(&pattern_proc)
          Module.new do
            @pattern_proc = pattern_proc
            @context_class = @@context_class

            def self.===(other)
              return false unless @context_class === other
              other.instance_eval(&@pattern_proc)
            end
          end
        end
      end
    end
  end
end
