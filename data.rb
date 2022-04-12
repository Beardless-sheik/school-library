require 'json'
require_relative './book'
require_relative './person'

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
end
