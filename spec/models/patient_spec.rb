require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many(:doctor_patients)}
    it { should have_many(:doctors).through(:doctor_patients)}
  end

  before :each do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @doctor1 = @hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor2 = @hospital1.doctors.create!(name: "Meridith Grey", specialty: "Surgeon", university: "Seattle University")
    @doctor3 = @hospital1.doctors.create!(name: "Alex Hotguy", specialty: "Internal Medicine", university: "Seattle University")

    @patient1 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient2 = Patient.create!(name: "Sam Smith", age: 27)
    @patient3 = Patient.create!(name: "John Little", age: 19)

    DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient1.id)
    DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient3.id)
    DoctorPatient.create(doctor_id: @doctor2.id, patient_id: @patient2.id)
    DoctorPatient.create(doctor_id: @doctor3.id, patient_id: @patient2.id)
    DoctorPatient.create(doctor_id: @doctor3.id, patient_id: @patient3.id)
  end

  it 'has patients list by age' do
    expect(Patient.age_list).to eq([@patient3, @patient2, @patient1])
  end
end