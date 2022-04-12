require_relative './rental'

# This book class shows a Book as being an object in the Library(it hasa  title & author attribue & a rentals Array)
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(person, date)
    Rental.new(date, person, self)
  end

  def to_json(*args)
    {
      'data'             => [ title, author ]
    }.to_json(*args)
  end
  def self.json_create(object)
    new(*object['data'])
  end
end
