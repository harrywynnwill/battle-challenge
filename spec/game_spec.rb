require 'game'

describe Game do
  subject(:game) {described_class.new(player1, player2)}
  subject(:finished_game) {described_class.new(dead_player, player1)}

  let(:player1) { double :player, hit_points: 60} #why is hit points using symbols the other way??
  let(:player2) { double :player, hit_points: 60}
  let(:dead_player) {double :player, hit_points: 0}

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
  describe '#game_over' do
    it 'returns true if the player has zero HP' do
      expect(finished_game.game_over?).to be true
    end
  end
end
