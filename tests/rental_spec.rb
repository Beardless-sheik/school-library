require_relative '../rental'

describe Rental do
  context 'When testing the Classroom class' do
    before :each do
      @student = double('Student', classroom: @classroom, age: 20, parent_permission: true, name: 'Alick', rentals: [])
      @book = double('Book', title: 'Title', author: 'Author', rentals: [])
      @rental = Rental.new('2022-13-04', @student, @book)
    end

    it 'should create an instance object of this class' do
      rental_class = @rental.class

      expect(rental_class).to be Rental
    end

    it 'should push a rental to the book object' do
      book_rentals = @book.rentals

      expect(book_rentals.length).to be 1
    end

    it 'should push a rental to the student object' do
      student_rentals = @student.rentals

      expect(student_rentals.length).to be 1
    end
  end
end
