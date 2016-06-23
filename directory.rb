@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
    puts "Please enter students cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "Unknown".to_sym
    end
    @students << {name: name, cohort: cohort}
    if @students.length < 2
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
     puts "Please enter the next students name"
     name = gets.chomp
  end
   if @students.length < 1
     puts "No students where entered"
     exit
   else
     @students
   end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
   end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

 def process(selection)
   case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
     puts "I don't know what you mean, try again"
   end
 end

 def print_header
   puts "The students of Makers Academy"
   puts "----------------"
 end

 def print_students_list(students)
   cohort_sorted = @students.group_by { |hash| hash[:cohort] }
   cohort_sorted.each do |k,v|
     puts "Cohort #{k}"
     v.each do |student|
       puts "Name: #{student[:name]}"
     end
   end
 end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

interactive_menu
