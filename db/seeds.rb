puts "Building users..."
madison = User.where(
  email: "madison@sccsc.com",
  admin: true
).first_or_create!(password: "madisonmadison")

danny = User.where(
  email: "burtdaniel@gmail.com",
  admin: true,
).first_or_create!(password: 'password')

cj = User.where(
  email: "cjavilla@gmail.com",
  captain: true,
  athlete_id: 1
).first_or_create!(password: 'password')

random_officer = User.where(
  email: "random_officer@sccsc.com",
  officer: true,
).first_or_create!(password: 'password')

puts "Building UNR..."
a_school = School.where(
  name: "University of Nevada Reno",
  abbreviation: "UNR"
).first_or_create!

puts "Building UNLV..."
b_school = School.where(
  name: "University of Nevada Las Vegas",
  abbreviation: "UNLV"
).first_or_create!


puts "Building team..."
a_team_1 = a_school.teams.where(
  sex: 0,
  discipline: 0
).first_or_create!

a_team_2 = a_school.teams.where(
  sex: 1,
  discipline: 0
).first_or_create!

a_team_3 = a_school.teams.where(
  sex: 0,
  discipline: 1
).first_or_create!

a_team_4 = a_school.teams.where(
  sex: 1,
  discipline: 1
).first_or_create!

b_team_1 = b_school.teams.where(
  sex: 0,
  discipline: 0
).first_or_create!


puts "Building athletes..."
5.times do |x|
  a_team_1.athletes.create!(
    bib_number: x,
    sex: 0,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    uscsa_number: x,
  )
  
  a_team_2.athletes.create!(
    bib_number: x + 6,
    sex: 1,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    uscsa_number: 100 + x,
  )
  a_team_3.athletes.create!(
    bib_number: x + 12,
    sex: 0,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    uscsa_number: 200 + x,
  )
  
  a_team_4.athletes.create!(
    bib_number: x + 18,
    sex: 1,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    uscsa_number: 300 + x,
  )
  
  b_team_1.athletes.create!(
    bib_number: x + 24,
    sex: 0,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    uscsa_number:400 + x,
  )
  
end

january_meet = Meet.where(
  name: "January Meet. First of the year",
).first_or_create!

february_meet = Meet.where(
  name: "February Meet. Second of the year",
).first_or_create!

today = Date.current

first_jan_event = january_meet.events.where(
  meet_id: january_meet.id,
  start_at: today,
  sex: 0,
  discipline: 0,
  race_type: 0,
).first_or_create!

second_jan_event = january_meet.events.where(
  meet_id: january_meet.id,
  start_at: today + 1,
  sex: 1,
  discipline: 0,
  race_type: 0,
).first_or_create!

third_jan_event = january_meet.events.where(
  meet_id: january_meet.id,
  start_at: today + 2,
  sex: 0,
  discipline: 1,
  race_type: 1,
).first_or_create!

fourth_jan_event = january_meet.events.where(
  meet_id: january_meet.id,
  start_at: today + 3,
  sex: 1,
  discipline: 1,
  race_type: 1,
).first_or_create!

first_feb_event = february_meet.events.where(
  meet_id: february_meet.id,
  start_at: today + 30,
  sex: 1,
  discipline: 1,
  race_type: 1,
).first_or_create!