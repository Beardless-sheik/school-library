module UserCreator
  def self.student_info
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    parent_permission = parent_permission == 'y'
    [age, name, parent_permission]
  end

  def self.teacher_info
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp
    [specialization, age, name]
  end
end
