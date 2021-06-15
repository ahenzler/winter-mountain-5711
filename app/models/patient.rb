class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
  has_many :hospitals, through: :doctors

  def self.age_list
    order(:age)
  end
end