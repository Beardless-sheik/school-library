require_relative '../book'

describe 'Book Class' do
  before :each do
    @book = Book.new('Title', 'Author')
  end

  context 'With valid input to #new' do
    it 'instance created should be a book object that has a class of Books' do
      instance_class = @book.class

      expect(instance_class).to be Book
    end

    it 'instance created should have a title isntance property as what is given' do
      instance_property = @book.title

      expect(instance_property).to eq 'Title'
    end
    it 'instance created should have an rentals instance property that is an empty array' do
      instance_property = @book.rentals

      expect(instance_property).to eq []
    end
  end

  context 'with valid input #add_rentals' do
    it 'rentals instance property should have one element ' do
      alick = double('Person', age: 20, parent_permission: true, name: 'Alick', rentals: [])
      @book.add_rentals(alick, '10 December')
      instance_property = @book.rentals

      expect(instance_property.length).to eq 1
    end

    it 'the first element in the rentals instance property should have a class rental' do
      alick = double('Person', age: 20, parent_permission: true, name: 'Alick', rentals: [])
      @book.add_rentals(alick, '10 December')
      instance_property_class = @book.rentals[0].class

      expect(instance_property_class).to be Rental
    end
  end
end
