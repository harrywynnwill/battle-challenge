require './lib/player'
class Game
  attr_reader :player1, :player2
  def initialize(player1, player2)
    @players= [player1, player2]
  end

  def attack(player)
    player.receive_damage
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end
  def current_player
    player1
  end
  def switch_turn
   @players = @players.reverse
    current_player
  end


end
