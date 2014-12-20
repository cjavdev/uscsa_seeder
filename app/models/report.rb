class Report
  def self.find(name)
    case name
    when 'athletes_by_school_alpha'
      Roster.new(
        'athletes.*, schools.name',
        'school.name',
        ["name"]
      ) do |athlete|
        row = athlete_columns.map { |col| athlete.send(col) }
        row << athlete.school.name
      end
    when 'athletes_by_school_discipline'
      []
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
      []
    when 'seeding_by_event_by_school'
      []
    when 'seeding'
      []
    end
  end

  def self.athlete_columns
    Athlete.columns.map(&:name)
  end
end
