require 'json'
require_relative './person'
require_relative './student'

class Data
  def save_books(books)
    if File.empty?('./books.json')
      File.write("./books.json", JSON.generate(books), mode: "a")
    else
      file = File.open('./books.json')
      file_data = JSON.parse(file.read)
      books.each do |book|
        file_data.push({"data"=>["#{book.title}", "#{book.author}"]})
      end
      File.write('./books.json', JSON.generate(file_data), mode: "w")
      file.close
    end
  end

  def save_persons(persons)
    start = Time.now
    if File.empty?('./persons.json')
      File.write("./persons.json", JSON.generate(persons), mode: "a")
    else
      file = File.open('./persons.json')
      file_data = JSON.parse(file.read)
      persons.each do |person|
        file_data.push({"data"=>["#{person.name}", "#{person.age}", "#{person.id}"]})
      end
      File.write('./persons.json', JSON.generate(file_data), mode: "w")
      file.close
    end
    finish = Time.now
    diff = finish - start
    p diff
  end
end
