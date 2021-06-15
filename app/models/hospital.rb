class Hospital < ApplicationRecord
  has_many :doctors
  has_many :patients, through: :doctors

  def doctor_count
    doctors.distinct.count
  end
  def university_list
    doctors.select(:university).group(:university).pluck(:university)
  end
end
