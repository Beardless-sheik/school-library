require_relative '../nameable'

describe Nameable do
  context 'When testing the Nameable class' do
    before :each do
      @nameable = Nameable.new
    end

    it 'should create an instance object of this class' do
      nameable_class = @nameable.class

      expect(nameable_class).to be Nameable
    end

    it 'should raise an error when calling correct_name method' do
      expect { @nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

describe BaseDecorator do
  context 'When testing the BaseDecorator class' do
    before :each do
      person = double('Person', age: 20, parent_permission: true, name: 'Alick', rentals: [])
      allow(person).to receive(:correct_name) { person.name }
      @base_decorator = BaseDecorator.new(person)
    end

    it 'should create an instance object of this class' do
      base_decorator_class = @base_decorator.class

      expect(base_decorator_class).to be BaseDecorator
    end

    it 'should return person name when calling correct_name' do
      base_decorator_name = @base_decorator.correct_name

      expect(base_decorator_name).to eq 'Alick'
    end
  end
end
