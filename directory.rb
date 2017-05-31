#let's put all student into an array
require "csv"
@students = []


MONTHS = %w(january february march april may june july august september october november december January February March April May June July August September October November December).to_a


def add_student(name, cohort, country, hobbies, major)
    @students << {name: name, cohort: cohort.to_sym, country: country, hobbies: hobbies, major: major}
end

def get_name
end

def get_cohort
  puts "Please enter the cohort"
  cohort_input = STDIN.gets.chop
  while !(cohort_input.is_a? String) || cohort_input == "" || !MONTHS.include?(cohort_input)
    puts "Please enter a correct name of the month for cohort"
    cohort_input = STDIN.gets.chop
  end
  cohort_input
end

def get_country
  puts "Please enter the country"
  country = STDIN.gets.chop
  while !(country.is_a? String) || country == ""
    puts "Please enter a correct country"
    country = STDIN.gets.chop
  end
  country
end

def get_hobbies
  puts "Please enter hobbies"
  hobbies = STDIN.gets.chop
  while !(hobbies.is_a? String) || hobbies == ""
    puts "Please enter a correct hobby"
    hobbies = STDIN.gets.chop
  end
  hobbies
end

def get_major
  puts "Please enter a major"
  major = STDIN.gets.chop
  while !(major.is_a? String) || major == ""
    puts "Please enter a correct major"
    major = STDIN.gets.chop
  end
  major
end



def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
  name  = STDIN.gets.chop
  while !name.empty? do
    # add the student hash to the array
    cohort_input = get_cohort
    country = get_country
    hobbies = get_hobbies
    major = get_major
    add_student(name, cohort_input.to_sym, country, hobbies, major)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    puts "Enter the name of a new student"
    name = STDIN.gets.chop
  end
end

def max_length(array, symbol)
  max = 0
  array.each do |element|
    max = element[symbol].to_s.length if max < element[symbol].to_s.length
  end
  max
end



def print_student_list
  max_length_name = max_length(@students, :name)
  max_length_cohort = max_length(@students, :cohort)
  max_length_country = max_length(@students, :country)
  max_length_hobbies = max_length(@students, :hobbies)
  max_length_major = max_length(@students, :major)
  if @students.count > 0
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name].center(max_length_name)}, (#{student[:cohort].to_s.center(max_length_cohort)} cohort), #{student[:country].center(max_length_country)}, #{student[:hobbies].center(max_length_hobbies)}, #{student[:major].center(max_length_hobbies)}"
    end
  end
end

def print_with_while
  i = 0
  max_length_name = max_length(@students, :name)
  max_length_cohort = max_length(@students, :cohort)
  max_length_country = max_length(@students, :country)
  max_length_hobbies = max_length(@students, :hobbies)
  max_length_major = max_length(@students, :major)
  while i < @students.length
    puts "#{i + 1}. #{@students[i][:name].center(max_length_name)}, (#{@students[i][:cohort].to_s.center(max_length_cohort)} cohort), #{@students[i][:country].center(max_length_country)}, #{@students[i][:hobbies].center(max_length_hobbies)}, #{@students[i][:major].center(max_length_hobbies)}"
    i += 1
  end
end

def print_cohort(cohort)
  max_length_name = max_length(@students, :name)
  max_length_cohort = max_length(@students, :cohort)
  max_length_country = max_length(@students, :country)
  max_length_hobbies = max_length(@students, :hobbies)
  max_length_major = max_length(@students, :major)
  students.each_with_index do |student, index|
    if student[:cohort].to_s == cohort
      puts "#{index + 1}. #{student[:name].center(max_length_name)}, (#{student[:cohort].to_s.center(max_length_cohort)} cohort), #{student[:country].center(max_length_country)}, #{student[:hobbies].center(max_length_hobbies)}, #{student[:major].center(max_length_hobbies)}"
    end
  end
end

def print_first_letter(letter)
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == letter
  end
end

def print_header
 count = @students.count
 if count == 1
  puts "The students of Villains Academy"
  puts "---------------------"
 end
end

def print_footer
  count = @students.count
  if count == 1
    puts "Overall, we have 1 great student"
  elsif count > 1
    puts "Overall, we have #{count} students"
  end
end


def show_students
  print_header
  print_student_list
  print_footer
end


def save_students
  puts "Please enter the name of the file where you want to save the records"
  path = File.absolute_path("") + "/" + STDIN.gets.chomp
  CSV.open(path, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort], student[:country], student[:hobbies], student[:major]]
    end
  end
end

=begin
def save_students
  puts "Please enter the name of the file where you want to save the records"
  File.open(STDIN.gets.chomp, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:country], student[:hobbies], student[:major]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end
=end


def load_students
  puts "Please enter the name of the file from where you want to load records"
  filename = STDIN.gets.chomp
  path = File.absolute_path("") + "/" + filename
  if File.exists?(filename)
    CSV.foreach(path) do |row|
      name, cohort, country, hobbies, major = row
      add_student(name, cohort.to_sym, country, hobbies, major)
    end
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end


def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end


def print_menu
  puts "1. Input the students"
  puts "2. List the students"
  puts "3. Save the list"
  puts "4. Load students"
  puts "9. Exit"
end


def process(selection)
  case selection
  when "1"
    students = input_students
    puts "You have successfully added #{@students.count} students. Please chose another option."
  when "2"
    show_students
    puts "#{@students.count} students were successfully listed. Please chose another option."
  when "3"
    save_students
    puts "#{@students.count} students were successfully saved. Please chose another option."
  when "4"
    previous_count = @students.count
    load_students
    puts "#{@students.count - previous_count} students were successfully loaded. Please chose another option."
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    #2. do what user has asked
    process(STDIN.gets.chomp)
  end
end



interactive_menu
