require_relative './person'

# This Student class can be initialised by passing classroom, Age, Name & parent permission.
class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, parent_permission, name = 'Unknown')
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
