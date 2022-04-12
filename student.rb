require_relative './person'

# This Student class can be initialised by passing classroom, Age, Name & parent permission.
class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, parent_permission, name = 'Unknown', id = rand(1..10_000))
    super(age, parent_permission, name, id)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
