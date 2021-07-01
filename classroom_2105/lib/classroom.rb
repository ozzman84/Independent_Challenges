class Classroom
  attr_reader :subject,
              :capacity,
              :students

  def initialize(subject, capacity)
    @subject = subject
    @capacity = capacity
    @students = []
  end

  def add_student(name)
    @students << name
  end

  def yell_at_students
    @students.map(&:upcase)
  end
end
