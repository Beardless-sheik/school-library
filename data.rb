require 'json'

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
end
