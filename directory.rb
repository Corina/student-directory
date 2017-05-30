#let's put all student into an array


MONTHS = %w(january february march april may june july august september october november december January February March April May June July August September October November December).to_a


def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students  = []
  # get the first name
  name  = gets.chop
  while !name.empty? do
    # add the student hash to the array
    puts "Please enter the cohort"
    cohort_input = gets.chop
    while !(cohort_input.is_a? String) || cohort_input == "" || !MONTHS.include?(cohort_input)
      puts "Please enter a correct name of the month for cohort"
      cohort_input = gets.chop
    end
    puts "Please enter the country"
    country = gets.chop
    puts "Please enter hobbies"
    hobbies = gets.chop
    puts "Please enter major"
    major = gets.chop
    students << {name: name, cohort: cohort_input.to_sym, country: country, hobbies: hobbies, major: major}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter the name of a new student"
    name = gets.chop
  end
  # return the array of students
  students
end

def max_length(array, symbol)
  max = 0
  array.each do |element|
    max = element[symbol].to_s.length if max < element[symbol].to_s.length
  end
  max
end

def print(students)
  max_length_name = max_length(students, :name)
  max_length_cohort = max_length(students, :cohort)
  max_length_country = max_length(students, :country)
  max_length_hobbies = max_length(students, :hobbies)
  max_length_major = max_length(students, :major)
  if students.count > 0
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name].center(max_length_name)}, (#{student[:cohort].to_s.center(max_length_cohort)} cohort), #{student[:country].center(max_length_country)}, #{student[:hobbies].center(max_length_hobbies)}, #{student[:major].center(max_length_hobbies)}"
    end
  end
end

def print_with_while(students)
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

def print_cohort(students, cohort)
  max_length_name = max_length(students, :name)
  max_length_cohort = max_length(students, :cohort)
  max_length_country = max_length(students, :country)
  max_length_hobbies = max_length(students, :hobbies)
  max_length_major = max_length(students, :major)
  students.each_with_index do |student, index|
    if student[:cohort].to_s == cohort
      puts "#{index + 1}. #{student[:name].center(max_length_name)}, (#{student[:cohort].to_s.center(max_length_cohort)} cohort), #{student[:country].center(max_length_country)}, #{student[:hobbies].center(max_length_hobbies)}, #{student[:major].center(max_length_hobbies)}"
    end
  end
end

def print_first_letter(students, letter)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == letter
  end
end

def print_header(students)
 count = students.count
 if count == 1
  puts "The students of Villains Academy"
  puts "---------------------"
 end
end

def print_footer(students)
  count = students.count
  if count == 1
    puts "Overall, we have 1 great student"
  elsif count > 1
    puts "Overall, we have #{count} students"
  end
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. List the students"
    puts "9. Exit"
    #2. read and save the Input
    selection = gets.chomp
    #3. do what user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header(students)
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
    end
  end
end

interactive_menu
