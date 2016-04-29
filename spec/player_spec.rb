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

  describe '#receive_damage' do
    it 'reduces the player hit points' do
      expect { mara.receive_damage }.to change { mara.hit_points }.by(-10)
    end
  end
  describe '#receive_damage_rand' do
    it 'reduces the players hit point by a random number between 1 and 10' do
    #allow(mara).to receive(:receive_damage_rand) {10}
    allow(mara).to receive(:rand ) {10}
    expect{mara.receive_damage_rand}.to change {mara.hit_points}.by(-10)
    end
  end
end