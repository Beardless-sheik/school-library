require_relative './nameable'

# This Person class is based on Nameable class & be initialised by passing Age, Name & parent permission.
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || parent_permission == true
  end

  private

  def of_age?
    @age >= 18
  end
end
