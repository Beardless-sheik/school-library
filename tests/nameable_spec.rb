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

    it 'should return person name when calling correct_name method' do
      base_decorator_name = @base_decorator.correct_name

      expect(base_decorator_name).to eq 'Alick'
    end
  end
end

describe CapitalizeDecorator do
  context 'When testing the CapitalizeDecorator class' do
    before :each do
      person = double('Person', age: 20, parent_permission: true, name: 'alick', rentals: [])
      allow(person).to receive(:correct_name) { person.name }
      @capitalize_decorator = CapitalizeDecorator.new(person)
    end

    it 'should create an instance object of this class' do
      capitalize_decorator_class = @capitalize_decorator.class

      expect(capitalize_decorator_class).to be CapitalizeDecorator
    end

    it 'should capitalize the string when calling correct_name method' do
      capitalize_decorator_name = @capitalize_decorator.correct_name

      expect(capitalize_decorator_name).to eq 'Alick'
    end
  end
end

describe TrimmerDecorator do
  context 'When testing the TrimmerDecorator class' do
    before :each do
      person = double('Person', age: 20, parent_permission: true, name: 'alick welloy nyirenda', rentals: [])
      allow(person).to receive(:correct_name) { person.name }
      @trimmer_decorator = TrimmerDecorator.new(person)
    end

    it 'should create an instance object of this class' do
      trimmer_decorator_class = @trimmer_decorator.class

      expect(trimmer_decorator_class).to be TrimmerDecorator
    end

    it 'should trim the string to 10 characters when calling correct_name method' do
      trimmer_decorator_name = @trimmer_decorator.correct_name

      expect(trimmer_decorator_name).to eq 'alick well'
    end
  end
end
