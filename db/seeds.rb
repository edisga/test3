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

user = User.new(
  email: "joseluis@gmail.com",
  password: "Unmomentojavi"
)
user.save!
puts "#{user.email} created!"

puts "Creating Teacher..."

teacher = Teacher.new(
  name: "Carolina",
  last_name: "Lacasta",
  description: "Soy una loba de mar. He navegado más millas que la embarcación Gusanito",
  email: "carolina@gmail.com",
  password: "Tratamebien"
)

teacher.save!
puts "#{teacher.name} created"

puts "Creating Courses..."

courses = ["Patrón de Navegación Básica", "Patrón de Embarcación de Recreo"]

courses.each do |course_title|
  puts "Creating #{course_title} course..."
  course = Course.new(
    title: course_title,
    description: "Con el título de PNB Patrón de Navegación Básica podrás gobernar embarcaciones de hasta 8 metros de eslora y navegar hasta una distancia máxima de la costa de cinco millas.",
    duration: 6,
    teacher: teacher
  )
  course.save!
  puts "#{course.title} created!"

  puts "Adding modules..."
  modules = ["Nomenclatura Náutica", "Elementos de amarre y fondeo", "Seguridad en la Mar", "Legislación", "Normativa"]
  modules.each_with_index do |module_title, index|
    puts "Adding #{module_title}"
    modul = Modul.new(
      title: module_title,
      download_document: "Descarga documento",
      description: "Esta es la descripción del módulo",
      order: index,
      course: course
    )
    modul.save!
    puts "#{modul.title} created!"

    puts "Adding lessons..."
    lessons = ["Marcas Laterales", "Marcas cardinales", "Marcas de peligro", "Marcas de agua", "Peligros nuevos"]
    lessons.each do |lesson_title|
      lesson = Lesson.new(
        title: lesson_title,
        modul: modul
      )
      lesson.save!
      puts "#{lesson.title} created!"

      puts "Adding sections..."
      8.times do
      section = Section.new(
        title: Faker::Book.title,
        description: Faker::Lorem.paragraph,
        favorite_class: [true, false, false, false].sample,
        lesson: lesson
      )
      end

      puts "Adding questions..."
      num = 1
      5.times do
        question = Question.new(
          title: Faker::Book.title,
          state: Faker::Address.state,
          year: Faker::Date.between(from: '2014-09-14', to: Date.today),
          lesson: lesson
        )
        question.save!

        num_ans = 1
        4.times do
          # Para que la tercera questión siempre sea la correcta.
          if num_ans == 3
            correct_answer = true
          else
            correct_answer = false
          end

          answer = Answer.new(
            answer: Faker::Lorem.sentence,
            question: question,
            correct_answer: correct_answer
          )
          answer.save!
          num_ans += 1
        end
        
        puts "#{num} question"
        num += 1
      end
    end
  end
end

