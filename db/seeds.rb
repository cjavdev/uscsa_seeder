puts "Building users..."
madison = User.where(
  email: "madison@sccsc.com",
  admin: true,
  captain: false
).first_or_create!(password: "madisonmadison")

danny = User.where(
  email: "burtdaniel@gmail.com",
  admin: true,
  captain: false
).first_or_create!(password: 'password')

cj = User.where(
  email: "cjavilla@gmail.com",
  captain: true
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
a_team = a_school.teams.where(
  sex: 0,
  discipline: 0
).first_or_create!

b_team = b_school.teams.where(
  sex: 0,
  discipline: 0
).first_or_create!


puts "Building athletes..."
10.times do |x|
  a_team.athletes.create!(
    bib_number: x,
    sex: 0,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    uscsa_number: 73 + x,
  )

  b_team.athletes.create!(
    bib_number: 10 + x,
    sex: 1,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    uscsa_number: 217 + x,
  )
end

cj.athlete_id = Athlete.last.id
cj.save!

january_meet = Meet.where(
  name: "January Meet. First of the year",
).first_or_create!

today = Date.today

first_event = Event.where(
  meet_id: january_meet.id,
  start_at: today,
  sex: 0,
  discipline: 1,
  race_type: 1,
).first_or_create!