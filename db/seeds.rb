# db/seeds.rb

# Clear existing data
Teacher.destroy_all
Student.destroy_all

# Create sample teachers
teacher1 = Teacher.create!(
  email: 'teacher1@example.com',
  password: 'password',  # Use a secure password in production
  name: 'Teacher One'
)

teacher2 = Teacher.create!(
  email: 'teacher2@example.com',
  password: 'password',
  name: 'Teacher Two'
)


# Create sample students for teacher1
Student.create!(
  [
    { name: 'Student A', marks: 85, subject: subject1, teacher: teacher1 },
    { name: 'Student B', marks: 90, subject: subject2, teacher: teacher1 },
    { name: 'Student C', marks: 75, subject: subject3, teacher: teacher1 }
  ]
)

# Create sample students for teacher2
Student.create!(
  [
    { name: 'Student D', marks: 88, subject: subject1, teacher: teacher2 },
    { name: 'Student E', marks: 92, subject: subject2, teacher: teacher2 },
    { name: 'Student F', marks: 80, subject: subject3, teacher: teacher2 }
  ]
)

puts "Seed data created successfully!"
