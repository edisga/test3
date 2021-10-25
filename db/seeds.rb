require 'faker'

puts "Cleaning all DB"
Answer.destroy_all
Course.destroy_all
Lesson.destroy_all
Modul.destroy_all
Question.destroy_all
Section.destroy_all
Teacher.destroy_all
User.destroy_all
puts "DB cleanded!"

puts "Creating new DB!"
puts "Creating user..."

user = User.new (
  email: "joseluis@gmail.com",
  password: "Unmomentojavi"
)

user.save!
puts "#{user.email} created!"

puts "Creating Teacher..."

teacher = Teacher.new (
  name: "Carolina",
  last_name: "Lacasta",
  description: "Soy una loba de mar. He navegado más millas que la embarcación Gusanito",
  email: "carolina@gmail.com",
  password: "Tratamebien"
)

teacher.save!
puts "#{teacher.name} created"

puts "Creating Courses"

5.times do
  

