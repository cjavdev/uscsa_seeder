class HeatAthlete < SimpleDelegator
  extend Forwardable

  def initialize(athlete, seeded)
    super(athlete)
    @athlete = athlete
    @seeded = seeded
  end

  attr_reader :athlete, :seeded

  def school_name
    @athlete.school.name
  end
end
