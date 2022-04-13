require_relative '../book'
require_relative '../person'

describe 'Person Class' do
  before :each do
    @person = Person.new(20, 'y', 'Alick')
  end

  context 'With valid input to #new' do
    it 'instance created should be a person object that has a class of Person' do
      instance_class = @person.class

      expect(instance_class).to be Person
    end

    it 'instance created should have a title isntance property age what is given' do
      instance_property = @person.age

      expect(instance_property).to eq 20
    end
  end

  context 'with valid input #correct_name' do
    it 'should return the names property as given when creating object' do
      instance_property = @person.correct_name

      expect(instance_property).to eq 'Alick'
    end
  end
end
