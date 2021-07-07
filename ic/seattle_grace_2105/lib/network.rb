class Network
  attr_reader :name,
              :hospitals

  def initialize(name)
    @name      = name
    @hospitals = []
  end

  def add_hospital(hospital)
    @hospitals << hospital
  end

  def highest_paid_doctor
    baller_doc = @hospitals.flat_map(&:doctors)
    baller_doc.max_by(&:salary)
  end

  def doctors_by_hospital
    hospital_doc_list = Hash.new

    @hospitals.each do |hospital|
      hospital_doc_list[hospital] = hospital.doctors.map(&:name)
    end
    hospital_doc_list
  end

  def doctors_by_specialty
    hash = Hash.new { |hash, key| hash[key] = [] }

    @hospitals.each do |hospital|
      hospital.doctors.each do |doctor|
        hash[doctor.specialty] << doctor.name
      end
    end
    hash
  end

  def average_doctors_salary
    salary_sum  = @hospitals.sum(&:total_salary)
    doctors_sum = @hospitals.sum do |hospital|
      hospital.doctors.length
    end
    salary_sum.fdiv(doctors_sum)
  end
end
