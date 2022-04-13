require_relative '../book' 
require_relative '../person'

describe "Person Class" do 
  before :each do
    @person = Person.new(20,"y","Alick")
  end

   context "With valid input to #new" do 
      it "instance created should be a person object that has a class of Person" do
         instanse_class = @person.class 
         
         expect(instanse_class).to be Person 
      end 
		
      it "instance created should have a title isntance property age what is given" do 
         instanse_property = @person.age

         expect(instanse_property).to eq 20
      end 
   end 

   context "with valid input #correct_name" do
     it "should return the names property as given when creating object" do
        instanse_property = @person.correct_name
        
        expect(instanse_property).to eq "Alick"
     end
   end

end