require_relative '../teacher'

describe 'Teacher Class' do
  before :each do
    @teacher = Teacher.new('Biology', 40, 'Alick')
  end

  context 'With valid input to #new' do
    it 'instance created should be a Student object that has a class of Student' do
      instance_class = @teacher.class

      expect(instance_class).to be Teacher
    end

    it 'instance created should have a specialization instance property as what is given' do
      instance_property = @teacher.specialization

      expect(instance_property).to eq 'Biology'
    end
  end

  context 'with valid input #can_use_services method' do
    it 'it should return true alway' do
      instance_property_method_return = @teacher.can_use_services?

      expect(instance_property_method_return).to be true
    end
  end
end
