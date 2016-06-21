#Outline the names of the students
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohot: :november},
{name: "ALex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Kruger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november},
]
#A method to introduce our list of students
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#A method to print out the names of the students
def print_names(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#A method to show the overall number of students from the list
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

print_header
print_names(students)
print_footer(students)
