require 'game'

describe Game do
  subject(:game) {described_class.new(player1, player2)}
  let(:player1) { double :player}
  let(:player2) { double :player}
  it { is_expected.to respond_to(:attack).with(1).argument }

  it 'starts with a first player' do
    expect(game.player1).to eq player1
  end

  it 'starts with a second player' do
    expect(game.player2).to eq player2
  end

  describe '#attack' do
    it 'damages the player' do
      allow(player2).to receive(:receive_damage)
      expect(game.attack(player2))
    end
  end
  describe '#current_player' do
    it 'tells the current player' do
      expect(game.current_player)
    end
  end
  describe '#switch turn' do
    it 'switches the turn to the other player' do
      game.switch_turn
      expect(game.current_player).to eq player2
    end
  end
end
