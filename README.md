# USCSA Seeder Database

**Pitch**: This is a tool for managing a league of athletes through out
a season of snow sport contests.

+ Athlete(id, bib_number, discipline, uscsa_num, eligible, school_id,
  first_name, last_name, gender)
+ Participant(id, athlete_id, race_id, seed_num) (rename: Participation?
EventEntry? AthleteEventEntry?)
+ Race(id, event_id, date, start_time, gender, race_type)
+ Team(id, school_id, discipline, gender)
+ School(id, name, abbreviation)
+ User(id, email, password_digest, session_token, invitation_token, 
  invitation_expiration, officer, captain, school_id, verified)
+ Event(id, date, name, abbreviation)

# User Stories

+  ~~ Officer can login ~~
+  ~~ Captain can login ~~
+  ~~ Officer can manage all teams ~~
+  ~~ Officer can manage all athletes ~~
+  ~~ Captain can manage athletes from her team ~~
+  Officer can import race data
+  Officer can import athlete data
+  Officer can invite up to three Captains per
+  Captain can seed athletes to races
+  When its race day
   + Captain sees read only roster
+  Officer can pull reports that:
   +  List of athletes by school, sorted alphabetically (last name)
   +  List of athletes by school, sorted by discipline, then alphabetically
   +  Complete roster (for admin purposes), sorted alphabetically
   +  Complete roster (for admin purposes), sorted by discipline, then alpha
   +  Complete roster of athletes by Bib number
   +  Complete roster of athletes by USCSA ID #
   +  Calendar of all of the races entered by date and start time.
   +  Seeding Report by race, by school
   +  Exports of daily race files need to be in .csv format or .txt  format
   +  Seeding

# Seeding Rules

+  Each school is allowed to seed as many athletes as they like that are on their team.
+  Men are seeded with men, women with women.
+  Skiers and snowboarders do not overlap.
+  Online seeding closes at 5 PM the day before the race.
+  For timed events (GS, SL), use the seed order as your start list.
+  For style events (SLP, HP, QP, JAM), use the seeds in the reverse
  order as your start list so the best athletes go last.
+  For BX events, use the seeding to generate the brackets.
+  There is a penalty for anyone who doesn't go online and seed by 5 PM the
  day before a race.

**NB**: (I would actually have a built-in process that has a simple
toggle for Officers to turn  on or off the access for Captains.  Then at
5 PM the day before,  you toggle off.  If someone wants to register,
then they have to call you and you can toggle back on and have them do
it, or you can seed for them automatically).

When the seeding file is generated for each race, the process is to take
all of the 1st seeds and randomly sort all of the first entires for each
team.  Then the 2nd seeds are all randomly sorted, then the 3rd seeds
are randomly sorted and so on and so forth.  This would get exported as
a .csv or .txt file.  Then this would be imported to the SplitSecond
timing system at Mammoth Mountain in a format they can use.

**NB**: Maybe we should allow Officers to invite unlimited captains per school because it looks like he said two captains per school and then two or three captains per school in the same email
