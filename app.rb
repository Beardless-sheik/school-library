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
require_relative 'console'
require_relative 'data'

class App < Console
  include Display
  include UserCreator
  include BookCreator
  include RentalCreator

  def initialize
    super()
    @data_manager = DataManager.new
    @people = []
    @books = @data_manager.load_books
    @rentals = []
    @class = Classroom.new('Form 6 Class')
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
      student = Student.new(@class, user_options[0], user_options[2], user_options[1])
      @people << student

      puts 'Student created successfully'
      sleep 0.75

    when '2'
      user_options = UserCreator.teacher_info
      teacher = Teacher.new(user_options[0], user_options[1], user_options[2])
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

  def preserve_user_data
    @data_manager.save_books(@books)
    @data_manager.save_people(@people)
    @data_manager.save_rentals(@rentals)
  end
end
