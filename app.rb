require_relative 'test_library'

def print_title(title)
  puts "\n_____ #{title} _____\n\n"
end

class App
  def initialize
    @library = Library.new
  end

  def list_books(title = 'List of Books')
    print_title('List of Books') unless title.empty?
    books = @library.list_books
    books.each.with_index { |book, index| puts "#{index + 1} -> #{book.title}, Author: #{book.author}" }
  end
1
  def list_people(title = 'List of People')
    print_title(title) unless title.empty?
    people = @library.list_people
    people.each.with_index { |person, index| puts "#{index + 1} -> #{person.name} (#{person.class.name})" }
  end

  def create_person
    print_title('Create a Person')
    print "Enter person type (T -> teacher or S -> student): "
    type = gets.chomp.upcase
    print "Enter person name: "
    name = gets.chomp.upcase
    print "Enter person age : "
    age = gets.chomp.to_i

    if type == 'T'
      @library.create_teacher(name, age)
    elsif type == 'S'
      print "Does the student have parent permission? (Y / N): "
      permission = gets.chomp.upcase == 'Y'
      @library.create_student(name, age, permission)
    else
      puts "\n Invalid person type."
    end
  end

  def create_book
    print_title('Create a Book')
    print "Enter book title : "
    title = gets.chomp.upcase
    print "Enter book author: "
    author = gets.chomp.upcase
    @library.create_book(title, author)
  end

  def create_rental
    print_title('Create a Rental')
    puts "Which book do you want to rent?\n\n"
    self.list_books("")
    print "\nEnter the number of the book to rent: "
    book_index = gets.chomp.to_i

    puts "\nWho wants to rent the book?\n\n"
    self.list_people("")
    print "\nEnter the number of the person to rent the book: "
    person_index = gets.chomp.to_i

    books = @library.list_books
    book = books[book_index - 1]
    
    people = @library.list_people
    person = people[person_index - 1]

    @library.create_rental(book, person)
  end

  def list_rentals_for_person
    print_title('List Rentals for Person')
    puts "Which person's rentals do you want to see?\n\n"
    self.list_people("")
    print "\nEnter the number of the person to see their rentals: "
    person_index = gets.chomp.to_i

    people = @library.list_people
    person = people[person_index - 1]

    if person.nil?
      puts "Person not found."
      return
    end

    rentals = @library.list_rentals_for_person(person)
    if rentals.empty?
      puts "This person has no rentals."
    else
      puts "___ List of Rentals for #{person.name} (#{person.class.name}) ___\n\n"
      rentals.each { |rental| puts "#{rental.book.title} (#{rental.date})" }
    end
  end
end
