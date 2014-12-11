puts "Building users..."
danny = User.where(
  email: "burtdaniel@gmail.com",
  admin: true
).first_or_create!(password: 'password')

cj = User.where(
  email: "cjavilla@gmail.com",
  captain: true
).first_or_create!(password: 'password')

puts "Building school..."
a_school = School.where(
  name: "University of Nevada Reno",
  abbreviation: "UNR"
).first_or_create!

puts "Building team..."
a_team = a_school.teams.where(
  sex: 0,
  discipline: 0
).first_or_create!

puts "Building athletes..."
if Athlete.count < 10
  10.times do |x|
    a_team.athletes.create!(
      bib_number: x,
      sex: 0,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
    )
  end
end

cj.athlete_id = Athlete.last.id
