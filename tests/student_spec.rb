require_relative '../student'

describe 'Student Class' do
  before :each do
    @student = Student.new('English', 20, true, 'Alick')
  end

  context 'With valid input to #new' do
    it 'instance created should be a Student object that has a class of Student' do
      instance_class = @student.class

      expect(instance_class).to be Student
    end

    it 'instance created should have a classroom isntance property as what is given' do
      instance_property = @student.classroom

      expect(instance_property).to eq 'English'
    end
  end

  context 'with valid input #classrom' do
    it 'it should return instance property classroom with correct value given when initialising ' do
      instance_property_method_return = @student.classroom
      expect(instance_property_method_return).to eq 'English'
    end
  end
end
