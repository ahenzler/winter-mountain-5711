require 'rails_helper'

RSpec.describe 'show' do
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

  describe 'doctor information' do
    it 'has doctor attributes hospital and patients' do
      visit "doctors/#{@doctor1.id}"

      expect(page).to have_content('Doctor Information')
      expect(page).to have_content('Name')
      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content('Specialty')
      expect(page).to have_content(@doctor1.specialty)
      expect(page).to have_content('University')
      expect(page).to have_content(@doctor1.university)
      expect(page).to have_content('Hospital')
      expect(page).to have_content(@hospital1.name)
      expect(page).to have_content('Patient List')
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient3.name)
    end

    it 'can remove a patient' do
      visit "doctors/#{@doctor1.id}"

      expect(page).to have_button("Remove #{@patient1.name}")
      click_on("Remove #{@patient1.name}")
      expect(page).to_not have_content(@patient1.name)
      expect(current_path).to eq("/doctors/#{@doctor1.id}")
    end
  end
end
