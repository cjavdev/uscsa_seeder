class Report
  def self.find(name)
    case name
    when 'athletes_by_school_alpha'
      Roster.new(
        'athletes.*, schools.name',
        'schools.name',
        ['name']
      ) do |athlete|
        row = athlete_columns.map { |col| athlete.send(col) }
        row << athlete.school.name
      end
    when 'athletes_by_school_discipline'
      Roster.new(
      'athletes.*, schools.name, teams.discipline',
      'schools.name, teams.discipline',
      ['name', 'discipline']
      ) do |athlete|
        row = athlete_columns.map { |col| athlete.send(col) }
        row << athlete.school.name
        row << athlete.team.discipline
      end
    when 'complete_roster_alpha'
      Athlete.order(:last_name)
    when 'complete_roster_discipline'
      Roster.new(
        'athletes.*, teams.discipline',
        'teams.discipline, athletes.last_name',
        ['discipline']
      ) do |athlete|
        row = athlete_columns.map { |col| athlete.send(col) }
        row << athlete.team.discipline
      end
    when 'complete_roster_bib_number'
      Roster.new(
        'athletes.*, teams.discipline',
        'bib_number',
        ['discipline']
      ) do |athlete|
        row = athlete_columns.map { |col| athlete.send(col) }
        row << athlete.team.discipline
      end
    when 'complete_roster_uscsa_number'
      Athlete.order(:uscsa_number)
    when 'seeding_by_event_by_school'
      []
    when 'seeding'
      []
    when 'meets_by_date_and_start_time'
      Struct.new(:dummy) do
        def to_csv
          CSV.generate({}) do |csv|
            csv << [
              'id',
              'meet',
              'event',
              'start_at',
              'sex',
              'discipline',
              'race_type',
              'full_race_type',
            ]
            Meet.includes(:events).order('events.start_at').each do |meet|
              meet.events.each do |event|
                csv << [
                  meet.id,
                  meet.name,
                  event.name,
                  event.start_at,
                  event.sex,
                  event.discipline,
                  event.race_type,
                  event.full_race_type,
                ]
              end
            end
          end
        end
      end.new(:meets_by_date_and_start_time)
    end
  end

  def self.athlete_columns
    Athlete.columns.map(&:name)
  end
end
