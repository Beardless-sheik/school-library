require_relative '../classroom'

describe Classroom do
  context 'When testing the Classroom class' do
    before :each do
      @classroom = Classroom.new('Calculus A')
    end
    it 'should create an instance object of this class' do
      classroom_class = @classroom.class

      expect(classroom_class).to be Classroom
    end

    it 'should initialize and store label inside of object' do
      classroom_label = @classroom.label

      expect(classroom_label).to eq 'Calculus A'
    end

    it 'should have an add_student method that adds a student into the @students' do
      student = double('Student', classroom: @classroom, age: 20, parent_permission: true, name: 'Alick')
      allow(student).to receive(:classroom=) { 'Calculus A' }

      @classroom.add_student(student)

      expect(@classroom.students.length).to be 1
    end
  end
end
