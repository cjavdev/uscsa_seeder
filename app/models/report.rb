class Report
  def self.find(name)
    case name
    when 'athletes_by_school_alpha'
      []
    when 'athletes_by_school_discipline'
      []
    when 'complete_roster_alpha'
      Athlete.order(:last_name)
    when 'complete_roster_discipline'
      Struct.new(:name) do
        def to_csv(options = {})
          athlete_relation = Athlete
            .unscoped
            .eager_load(:team)
            .select('athletes.*, teams.discipline')
            .order('teams.discipline, athletes.last_name')

          athlete_columns = Athlete.columns.map(&:name)
          CSV.generate(options) do |csv|
            csv << athlete_columns << ['discipline']
            athlete_relation.each do |athlete|
              row = athlete_columns.map { |col| athlete.send(col) }
              row << athlete.team.discipline
              csv << row
            end
          end
        end
      end.new('complete_roster_discipline')
    when 'complete_roster_bib_number'
      []
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
