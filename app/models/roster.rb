class Roster
  attr_reader :athletes_relation, :extra_columns, :athlete_blk

  def initialize(select = '*', order = 'id', extra_columns, &athlete_blk)
    @extra_columns = extra_columns
    @athlete_blk = athlete_blk
    @athletes_relation = Athlete
      .unscoped
      .eager_load(team: :school)
      .select(select)
      .order(order)
  end

  def to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << athlete_columns + extra_columns
      athletes_relation.each do |athlete|
        csv << athlete_blk.call(athlete)
      end
    end
  end

  def athlete_columns
    Athlete.columns.map(&:name)
  end
end
