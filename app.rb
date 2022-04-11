require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
require_relative 'display'
require_relative 'services/library_user_creator'
require_relative 'services/library_book_creator'
require_relative 'services/library_rental_creator'

class App
  include Display
  include UserCreator
  include BookCreator
  include RentalCreator

  def initialize
    @people = []
    @books = []
    @rentals = []
    @class = Classroom.new('Form 6 Class')
  end

  def run
    puts "'Welcome to the Ruby OOP module console API. Dont by your's truly Alick Nyirenda!"
    loop do
      menu
      option = gets.chomp
      break if option == '7'

      get_num(option)
    end
    puts 'Thank you for using our Library!'
  end

  def menu
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def get_num(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_by_person_id
    else
      puts 'Please enter a number between 1 and 7'
    end
  end

  def list_all_books
    puts 'There are no books yet! Kindly add books.' if @books.empty?

    Display.list(@books) { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    sleep 0.75
  end

  def list_all_people
    puts 'There are no people yet! Kindly add a student or teacher.' if @people.empty?
    Display.list(@people) do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id},
      Age: #{person.age}, Permission: #{person.parent_permission}"
    end
    sleep 0.75
  end

  def create_person
    print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    option = gets.chomp

    case option
    when '1'
      user_options = UserCreator.student_info
      age = user_options[0]
      name = user_options[1]
      parent_permission = user_options[2]
      student = Student.new(@class, age, parent_permission, name)
      @people << student

      puts 'Student created successfully'
      sleep 0.75

    when '2'
      user_options = UserCreator.teacher_info
      specialization = user_options[0]
      age = user_options[1]
      name = user_options[2]
      teacher = Teacher.new(specialization, age, name)
      @people << teacher

      puts 'Teacher created successfully'
      sleep 0.75
    else
      puts 'Invalid input. Kindly type 1 or 2'
    end
  end

  def create_book
    user_options = BookCreator.book_info
    title = user_options[0]
    author = user_options[1]
    puts "debugging app.rb line 114: title is '#{title}' & author is '#{author}'"
    book = Book.new(title, author)
    @books << book

    puts 'Book added successfully'
    sleep 0.75
  end
end

def create_rental
  user_options = RentalCreator.rental_info(@books, @people)
  book_id = user_options[0]
  person_id = user_options[1]
  date = user_options[2]
  rental = Rental.new(date, @people[person_id], @books[book_id])
  @rentals << rental

  puts 'Rental created successfully'
  sleep 0.75
end

def list_rentals_by_person_id
  print 'ID of person: '
  id = gets.chomp.to_i

  puts 'Rentals:'
  Display.list(@rentals) do |rental|
    puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
  end
  sleep 0.75
end
