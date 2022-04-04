class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end 
end

class Base_Decorator < Nameable
  attr_accessor :nameable
    # @param [Component] component
    def initialize(componentName)
      @nameable = componentName
    end

    def correct_name
      @nameable.correct_name
    end
end

class CapitalizeDecorator < Base_Decorator
  def correct_name
    @nameable.correct_name.upcase
  end
end

class TrimmerDecorator < Base_Decorator
  def correct_name
    @nameable.correct_name.slice(0, 10)
  end
end