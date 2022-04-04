class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end 
end

class Base_Decorator < Nameable
  attr_accessor :nameable
    # @param [Component] component
    def initialize(componentName)
      super()
      @namable = componentName
    end

    def operation
      @namable.correct_name
    end
end

class CapitalizeDecorator < Base_Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Base_Decorator
  def correct_name
    @nameable.correct_name.slice(0, 10)
  end
end