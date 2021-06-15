require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
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

  it 'has doctor count' do
    expect(@hospital1.doctor_count).to eq(3)
  end

  it 'has unique doctor - university list' do
    expect(@hospital1.university_list).to eq([@doctor1.university, @doctor2.university, @doctor3.university])
  end
end
