require_relative '../book'

describe "Book Class" do 
  before :each do
    @book = Book.new("Title", "Author")
  end

   context "With valid input to #new" do 
      it "instance created should be a book object that has a class of Books" do
         instanse_class = @book.class 
         expect(instanse_class).to be Book 
      end 
		
      it "instance created should have a title isntance property as what is given" do 
         instanse_property = @book.title
         expect(instanse_property).to eq "Title"
      end 
      it "instance created should have an rentals instance property that is an empty array" do
        instanse_property = @book.rentals
        expect(instanse_property).to eq []
      end
   end 

   context "with valid input #add_rentals" do
     it "rentals instance property should have one element " do
        alick = double('Person', age:20, parent_permission:true, name:"Alick", rentals:[])
        @book.add_rentals(alick,"10 December")
        instanse_property = @book.rentals
        expect(instanse_property.length).to eq 1
     end

     it "the first element in the rentals instance property should have a class rental" do
      alick = double('Person', age:20, parent_permission:true, name:"Alick", rentals:[])
      @book.add_rentals(alick,"10 December")
      instanse_property_class = @book.rentals[0].class
      expect(instanse_property_class).to be Rental
    end
   end

end