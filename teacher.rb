require_relative './person'

# This Teacher class can be initialised by passing specialisation, Age, Name & parent permission.
class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
