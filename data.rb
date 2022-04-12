require 'json'
require_relative './book'

class Data
  def save_books(books)
    file = File.open('./books.json', 'w')
    book_store = books.map do |book|
      { title: book.title, author: book.author }
    end
    file.puts(JSON.generate(book_store))
    file.close
  end

  def save_persons(persons)
    if File.empty?('./persons.json')
      File.write('./persons.json', JSON.generate(persons), mode: 'a')
    else
      file = File.open('./persons.json')
      file_data = JSON.parse(file.read)
      persons.each do |person|
        file_data.push({ 'data' => [person.name.to_s, person.age.to_s, person.id.to_s] })
      end
      File.write('./persons.json', JSON.generate(file_data), mode: 'w')
      file.close
    end
  end
end
