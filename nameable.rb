class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end 
end

class Base_Decorator < Nameable
    # @param [Component] component
    def initialize(component)
      @namable = component
    end

    def operation
      @namable.correct_name
    end
end