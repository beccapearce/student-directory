def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
     when "1"
      students = input_students
     when "2"
      print_header
      print_student(students)
      print_footer(students)
     when "9"
       exit
     else
      puts "I don't know what you meant, try again"
    end
   end
end

def input_students
  students = []
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
    puts "Please enter students cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "Unknown".to_sym
    end
    students << {name: name, cohort: cohort}
    if students.length < 2
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
     puts "Please enter the next students name"
     name = gets.chomp
  end
   if students.length < 1
     puts "No students where entered"
     exit
   else
     students
   end
end

 def print_header
   puts "The students of Makers Academy".center(50)
 end

 def print_student(students)
   cohort_sorted = students.group_by { |hash| hash[:cohort] }
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

interactive_menu
