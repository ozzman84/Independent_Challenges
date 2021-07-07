class Hospital
  attr_reader :name,
              :chief_of_surgery,
              :doctors

  def initialize(name, chief_of_surgery, doctors)
    @name             = name
    @chief_of_surgery = chief_of_surgery
    @doctors          = doctors
  end

  def total_salary
    @doctors.sum(&:salary)
  end

  def lowest_paid_doctor
    @doctors.min_by(&:salary).name
  end


  def specialties
    @doctors.map(&:specialty)
  end
end
