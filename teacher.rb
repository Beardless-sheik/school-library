require_relative './person'

# This Teacher class can be initialised by passing specialisation, Age, Name & parent permission.
class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name = 'Unknown', id = rand(1..10_000), parent_permission: true)
    super(age, parent_permission, name, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
