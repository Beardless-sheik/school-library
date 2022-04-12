module BookCreator
  def self.book_info
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp
    [title, author]
  end
end
