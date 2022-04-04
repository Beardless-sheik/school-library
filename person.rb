class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.ran(1..10000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    is_of_age? || parent_permission == true
  end

  private :is_of_age?
  def is_of_age?
    @age >= 18
  end
end