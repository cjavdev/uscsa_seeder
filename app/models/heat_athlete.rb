class HeatAthlete
  extend Forwardable

  def initialize(athlete, seeded)
    @athlete = athlete
    @seeded = seeded
  end

  attr_reader :athlete, :seeded
  def_delegators :@athlete, :id, :first_name, :last_name

  def school_name
    @athlete.school.name
  end
end
