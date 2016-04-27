require 'player'

describe Player do
  subject(:mara) { Player.new('Mara') }
  subject(:harry) { Player.new('Harry') }
  describe '#name' do
    it 'returns name' do
      expect(mara.name).to eq 'Mara'
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(harry.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(mara).to receive(:receive_damage)
      harry.attack(mara)
    end
  end

  describe '#receive_damage' do
    it 'reduces the player hit points' do
      expect { mara.receive_damage }.to change { mara.hit_points }.by(-10)
    end
  end
end