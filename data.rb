require 'json'
require_relative './book'
require_relative './person'
require_relative './rental'

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
    people_array = people.map do |person|
      { name: person.name, age: person.age, id: person.id }
    end
    file.puts(JSON.generate(people_array))
    file.close
  end

  def save_rentals(rentals)
    file = File.open('./rentals.json', 'w')
    rentals_array = rentals.map do |rental|
      {date: rental.date, book: { Title: rental.book.title, Author: rental.book.author } , personId: rental.person.id }
    end
    file.puts(JSON.generate(rentals_array))
    file.close
  end
end
