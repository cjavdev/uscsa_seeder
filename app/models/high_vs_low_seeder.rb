class HighVsLowSeeder < Seeder
  def generate_seeds
    changeable = @athletes.dup
    heats = []
    until changeable.length == 0
      heats << changeable.shift(3) + changeable.pop(3)
    end
    heats
  end
end
