# Nameable class is created to show the default implementation of the correct_name method function
class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Base Decorator Class: A base decorator that implements the facility to recreate the correct_name method
# in the Nameable class differently in the future generatos we will build
class BaseDecorator < Nameable
  attr_accessor :nameable

  # @param [Component] component
  def initialize(component_name)
    super()
    @nameable = component_name
  end

  def correct_name
    @nameable.correct_name
  end
end

# Capitalise Decorator: A decorator that implements the correct_name method in the Nameable class differently
class CapitalizeDecorator < Base_Decorator
  def correct_name
    @nameable.correct_name.upcase
  end
end

# Trimmer Decorator: A decorator that implements the correct_name method in the Nameable class differently
class TrimmerDecorator < Base_Decorator
  def correct_name
    @nameable.correct_name.slice(0, 10)
  end
end
