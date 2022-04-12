require_relative './nameable'

# This Person class is based on Nameable class & be initialised by passing Age, Name & parent permission.
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id, :parent_permission

  def initialize(age, parent_permission, name = 'Unknown')
    super()
    @id = rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end
end
