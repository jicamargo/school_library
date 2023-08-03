# library.rb

require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'

# This class joins all the other classes together.
# It is responsible for creating and storing instances of the other classes,
class Library
  def initialize
    @people = []
    @books = []
    @classrooms = []
    @rentals = []
  end

  def create_teacher(name, age)
    teacher = Teacher.new(name, age)
    @people << teacher
    teacher
  end

  def create_student(name, age, parent_permission)
    student = Student.new(name, age, parent_permission)
    @people << student
    student
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    book
  end

  def create_classroom(label)
    classroom = Classroom.new(label)
    @classrooms << classroom
    classroom
  end

  def create_rental(book_rent, person_rent)
    person = @people.find { |p| p == person_rent }
    book = @books.find { |b| b == book_rent }

    if person && book
      date = Time.now.strftime('%Y-%m-%d')
      rental = Rental.new(date, book, person)
      @rentals << rental
      rental
    else
      puts 'Person or Book not found.'
    end
  end

  # Add other methods to interact with the classes as needed

  def list_books
    @books
  end

  def list_people
    @people
  end

  def list_rentals_for_person(person_rent)
    person = @people.find { |p| p == person_rent }
    if person
      @rentals.select { |rental| rental.person == person }
    else
      puts 'Person not found.'
    end
  end
end
