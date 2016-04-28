require 'game'

describe Game do
  subject(:game) {described_class.new}
  let(:player1) { double :player}
  let(:player2) { double :player}
  it { is_expected.to respond_to(:attack).with(1).argument }

  describe '#attack' do
    it 'damages the player' do
      allow(player2).to receive(:receive_damage)
      expect(game.attack(player2))
    end
  end
end


