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
