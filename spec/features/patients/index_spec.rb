require 'rails_helper'

RSpec.describe 'index' do
  before :each do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @doctor1 = @hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor2 = @hospital1.doctors.create!(name: "Meridith Grey", specialty: "Surgeon", university: "Seattle University")
    @doctor3 = @hospital1.doctors.create!(name: "Alex Hotguy", specialty: "Internal Medicine", university: "Oregon University")

    @patient1 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient2 = Patient.create!(name: "Sam Smith", age: 27)
    @patient3 = Patient.create!(name: "John Little", age: 19)

    DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient1.id)
    DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient3.id)
    DoctorPatient.create(doctor_id: @doctor2.id, patient_id: @patient2.id)
    DoctorPatient.create(doctor_id: @doctor3.id, patient_id: @patient2.id)
    DoctorPatient.create(doctor_id: @doctor3.id, patient_id: @patient3.id)
  end

  describe 'patient list' do
    it 'has a ordered patient list by age' do
      visit "/patients"

      expect(page).to have_content("Current Patients")
      expect(page).to have_content("Listed by Age")
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
      expect(page).to have_content(@patient3.name)
    end
  end
end
