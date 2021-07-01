class Classroom
  attr_reader :subject,
              :capacity,
              :students

  def initialize(subject, capacity)
    @subject = subject
    @capacity = capacity
    @students = []
  end
end
