class Network
  attr_reader :name,
              :hospitals

  def initialize(name)
    @name = name
    @hospitals = []
  end

  def add_hospital(hospital)
    @hospitals << hospital
  end

  def highest_paid_doctor
    doctor_list = @hospitals.flat_map(&:doctors)
    doctor_list.max_by(&:salary)
  end

  def doctors_by_hospital
    doctor_hash = Hash.new { |hash, key| hash[key] = [] }
    @hospitals.each do |hospital|
      hospital.doctors.each do |doctor|
        doctor_hash[hospital] << doctor.name
      end
    end
    doctor_hash
  end

  def doctors_by_specialty
    doctors_hash = Hash.new { |hash, key| hash[key] = [] }
    @hospitals.each do |hospital|
      hospital.doctors.group_by do |doctor|
        doctors_hash[doctor.specialty] << doctor.name
      end
    end
    doctors_hash
  end

  def average_doctors_salary
    salary_sum = @hospitals.sum(&:total_salary)
    doctor_sum = @hospitals.sum do |hospital|
      hospital.doctors.length
    end
    salary_sum.fdiv(doctor_sum)
  end
end
