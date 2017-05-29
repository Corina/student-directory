#let's put all student into an array
=begin
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]
=end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students  = []
  # get the first name
  name  = gets.chomp
  while !name.empty? do
    # add the student hash to the array
    puts "Please enter the country"
    country = gets.chomp
    puts "Please enter hobbies"
    hobbies = gets.chomp
    puts "Please enter major"
    major = gets.chomp
    students << {name: name, cohort: :november, country: country, hobbies: hobbies, major: major}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter the name of a new student"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
puts "The students of Villains Academy"
puts "---------------------"
end

=begin
def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
=end


def max_length(array, symbol)
  max = 0
  array.each do |element|
    max = element[symbol].to_s.length if max < element[symbol].to_s.length
  end
  max
end

def print(students)
  i = 0
  max_length_name = max_length(students, :name)
  max_length_cohort = max_length(students, :cohort)
  max_length_country = max_length(students, :country)
  max_length_hobbies = max_length(students, :hobbies)
  max_length_major = max_length(students, :major)
  while i < students.length
    puts "#{i + 1}. #{students[i][:name].center(max_length_name)}, (#{students[i][:cohort].to_s.center(max_length_cohort)} cohort), #{students[i][:country].center(max_length_country)}, #{students[i][:hobbies].center(max_length_hobbies)}, #{students[i][:major].center(max_length_hobbies)}"
    i += 1
  end
end

def print_first_letter(students, letter)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == letter
  end
end

def print_length(students, length=12)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length <=
    length
  end
end


def print_footer(students)
puts "Overall, we have #{students.count} great students"
end



#nothing happens until we call the method

students = input_students
print_header
print(students)
print_footer(students)
