require_relative './person'

# This Student class can be initialised by passing classroom, Age, Name & parent permission.
class Student < Person
  attr_accessor :classroom

  def initialize(_classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
