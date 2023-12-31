# main.rb

# This file is the main entry point of the application.
# It is responsible for the user interface (menu) and for
# calling the methods of the App class.

require_relative 'app'

def clear_console
  if RUBY_PLATFORM =~ /win32|win64|x64|\.NET|windows|cygwin|mingw32/i
    system('cls')
  else
    system('clear')
  end
end

def welcome_message
  puts "\n\n> > > > WELCOME TO LIBRARY APP < < < <\n\n"
end

def menu_options
  puts '  1. List all books'
  puts '  2. List all people'
  puts '  3. Create a person'
  puts '  4. Create a book'
  puts '  5. Create a rental'
  puts '  6. List rentals for a person'
  puts "  7. Exit\n\n\n"
end

def user_input
  print '  Please enter a number [1..7] to select an option: '
  choice = gets.chomp.to_i
  puts ' Invalid choice. Please try again (a number from 1 to 7).' unless choice.between?(1, 7)
  puts "\n"
  choice
end

def main_menu
  clear_console
  welcome_message
  menu_options
  user_input
end

def press_enter_to_continue
  puts "\nPress Enter to continue..."
  gets
end

def handle_choice(choice, app)
  case choice
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  else
    app.list_rentals_for_person
  end
end

def main
  app = App.new

  loop do
    choice = main_menu
    handle_choice(choice, app) if choice.between?(1, 6)
    if choice == 7
      puts ' < < < Goodbye! > > >'
      break
    end
    press_enter_to_continue
  end
end

main if __FILE__ == $PROGRAM_NAME
