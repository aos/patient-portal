# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Patient.delete_all
Doctor.delete_all
Appointment.delete_all

# Sample patient
patient = Patient.create({name: 'Mike Ross', age: '44'})

# Sample doctors
doctors = Doctor.create([
  {
    name: 'Gregory House', specialty: 'Infectious Disease', education: 'Medical School: John Hopkins, Residency: Internal Medicine, Fellowship in Infectious Disease'
  },
  {
    name: 'Shaun Murphy', specialty: 'Surgery', education: 'Medical School: San Jose Medical School, Residency: General Surgery, Fellowship in Pediatric Surgery'
  },
  {
    name: 'Shoara Vind', specialty: 'Psychiatry', education: 'Medical School: SUSOM, Residency: Psychiatry, Fellowship in Substance Abuse'
  }
])

# Sample appointments
patient.appointments.create([
  {start: Time.now.to_datetime, end: Time.now.to_datetime.end_of_day, symptoms: 'lump on back', doctor: doctors[1]},
  {start: Time.now.to_datetime, end: Time.now.to_datetime.end_of_day, symptoms: 'runny nose, cough', doctor: doctors[0]},
  {start: Time.now.to_datetime, end: Time.now.to_datetime.end_of_day, symptoms: 'fatigue, no motivation', doctor: doctors[2]}
])