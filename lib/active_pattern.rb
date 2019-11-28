require 'active_pattern/context'
require 'active_pattern/pattern_object'
require 'active_pattern/version'

module ActivePattern
  def self.[](context_class)
    Module.new.extend(ActivePattern::Context[context_class])
  end
end
