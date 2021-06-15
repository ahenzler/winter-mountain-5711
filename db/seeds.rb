DoctorPatient.destroy_all
Patient.destroy_all
Doctor.destroy_all
Hospital.destroy_all

@hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

@doctor1 = @hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
@doctor2 = @hospital1.doctors.create!(name: "Meridith Grey", specialty: "Surgeon", university: "Seattle University")
@doctor3 = @hospital1.doctors.create!(name: "Alex Hotguy", specialty: "Internal Medicine", university: "Oregon University")

@patient1 = Patient.create!(name: "Denny Duquette", age: 39)
@patient2 = Patient.create!(name: "Sam Smith", age: 27)
@patient3 = Patient.create!(name: "John Little", age: 19)

DoctorPatient.create(doctor_id: @doctor1, patient_id: @patient1)
DoctorPatient.create(doctor_id: @doctor1, patient_id: @patient3)
DoctorPatient.create(doctor_id: @doctor2, patient_id: @patient2)
DoctorPatient.create(doctor_id: @doctor3, patient_id: @patient2)
DoctorPatient.create(doctor_id: @doctor3, patient_id: @patient3)
