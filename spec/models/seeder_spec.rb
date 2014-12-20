describe Seeder do
  context 'with one team' do
    let(:athletes) do
      [
        [:a, 1],
        [:a, 2],
        [:a, 3],
        [:a, 4],
        [:a, 5],
        [:a, 6],
        [:a, 7],
      ]
    end

    it 'groups athletes, best with worst seed' do
      seeder = Seeder.new(athletes)
      expect(seeder.generate_seeds).to eq([
        athletes.shift(3) + athletes.pop(3),
        [[:a, 4]]
      ])
    end

    it 'generates groups that are at most 6 athletes long' do
      seeder = Seeder.new(athletes)
      expect(seeder.generate_seeds[0].length).to eq(6)
      expect(seeder.generate_seeds.length).to eq(2)
    end
  end

  context 'with multiple teams' do
    let(:athletes) do
      [
        [:a, 1], [:a, 2], [:a, 3], [:a, 4], [:a, 5], [:a, 6], [:a, 7],
        [:b, 1], [:b, 2], [:b, 3], [:b, 4], [:b, 5], [:b, 6],
        [:c, 1], [:c, 2], [:c, 3], [:c, 4]
      ]
    end

    it 'groups athletes, best with worst seed' do
      seeder = Seeder.new(athletes)
      expect(seeder.generate_seeds.first.map(&:last))
        .to contain_exactly(1, 1, 1, 7, 6, 6)
      expect(seeder.generate_seeds[1].map(&:last))
        .to contain_exactly(2, 2, 2, 5, 5, 4)
      expect(seeder.generate_seeds.last.map(&:last))
        .to contain_exactly(3, 3, 3, 4, 4)
    end

    it 'generates groups that are at most 6 athletes long' do
      seeder = Seeder.new(athletes)
      expect(seeder.generate_seeds[0].length).to eq(6)
      expect(seeder.generate_seeds.length).to eq(3)
    end
  end
end
