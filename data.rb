require 'json'
require_relative './book'

class DataManager
  def save_books(books)
    file = File.open('./books.json', 'w')
    book_store = books.map do |book|
      { title: book.title, author: book.author }
    end
    file.puts(JSON.generate(book_store))
    file.close
  end

  def save_people(people)
    file = File.open('./people.json', 'w')
    people_data = people.map do |person|
      { class: person.class, name: person.name, id: person.id, age: person.age, permission: person.parent_permission,
        specialization: (person.specialization if person.class.to_s == 'Teacher') }.compact
    end

    file.puts(JSON.generate(people_data))
    file.close
  end

  def save_rentals(rentals)
    file = File.open('./rentals.json', 'w')
    rental_data = rentals.map do |rental|
      { date: rental.date, book: { title: rental.book.title, author: rental.book.author }, personId: rental.person.id }
    end
    file.puts(JSON.generate(rental_data))
    file.close
  end

  def load_books
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
end
