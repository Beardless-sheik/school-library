require 'json'
require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class DataManager
  def save_books(books)
    return unless File.exist?('./books.json')

    file = File.open('./books.json', 'w')
    book_store = books.map do |book|
      { title: book.title, author: book.author }
    end
    file.puts(JSON.generate(book_store))
    file.close
  end

  def save_people(people)
    return unless File.exist?('./people.json')

    file = File.open('./people.json', 'w')
    people_data = people.map do |person|
      { class: person.class, name: person.name, id: person.id, age: person.age, permission: person.parent_permission,
        specialization: (person.specialization if person.class.to_s == 'Teacher') }.compact
    end

    file.puts(JSON.generate(people_data))
    file.close
  end

  def save_rentals(rentals)
    return unless File.exist?('./rentals.json')

    file = File.open('./rentals.json', 'w')
    rental_data = rentals.map do |rental|
      {
        date: rental.date,
        book: {
          title: rental.book.title,
          author: rental.book.author
        },
        person: {
          class: rental.person.class,
          id: rental.person.id,
          name: rental.person.name,
          age: rental.person.age,
          specialization: (rental.person.specialization if rental.person.class.to_s == 'Teacher')
        }.compact
      }
    end
    file.puts(JSON.generate(rental_data))
    file.close
  end

  def load_books
    return [] unless File.exist?('./books.json')

    file = File.read('./books.json')
    array = []
    if file.empty?
      array
    else
      parsed_data = JSON.parse(file)
      parsed_data.map do |data|
        array.push(Book.new(data['title'], data['author']))
      end
    end
    array
  end

  def load_people
    return [] unless File.exist?('./people.json')

    file = File.read('./people.json')
    array = []
    if file.empty?
      array
    else
      parsed_data = JSON.parse(file)
      parsed_data.map do |data|
        case data['class']
        when 'Student'
          array.push(Student.new('English', data['age'], data['permission'], data['name'], data['id']))

        when 'Teacher'
          array.push(Teacher.new(data['specialization'], data['age'], data['name'], data['id']))
        end
      end
    end
    array
  end

  def load_rentals
    return [] unless File.exist?('./rentals.json')

    file = File.read('./rentals.json')
    array = []

    if file.empty?
      array = []
    else
      JSON.parse(file).map do |data|
        case data['person']['class']
        when 'Student'
          student = Student.new('English', data['person']['age'], data['person']['permission'], data['person']['name'],
                                data['person']['id'])

        when 'Teacher'
          teacher = Teacher.new(data['person']['specialization'], data['person']['age'], data['person']['name'],
                                data['person']['id'])

        end
        book = Book.new(data['book']['title'], data['book']['author'])
        array.push(Rental.new(data['date'], data['person']['class'] == 'Student' ? student : teacher, book))
      end
    end
    array
  end
end
