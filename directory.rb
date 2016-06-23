@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
   end
end

def process(selection)
  case selection
   when "1"
     input_students
   when "2"
     show_students
   when "3"
     save_students
   when "4"
     load_students
   when "9"
     exit
   else
    puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "Please enter students cohort"
    cohort = STDIN.gets.chomp
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
     name = STDIN.gets.chomp
  end
   if @students.length < 1
     puts "No students where entered"
     exit
   else
     @students
   end
end

def show_students
  print_header
  print_students_list
  print_footer
end

 def print_header
   puts "The students of Makers Academy"
   puts "----------------"
 end

 def print_students_list
   cohort_sorted = @students.group_by { |hash| hash[:cohort] }
   cohort_sorted.each do |k,v|
     puts "Cohort #{k}"
     v.each do |student|
       puts "Name: #{student[:name]}"
     end
   end
 end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loades #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu
