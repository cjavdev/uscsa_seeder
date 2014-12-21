class BestLastSeeder < Seeder
  def generate_seeds
    [@athletes.dup.reverse]
  end
end
