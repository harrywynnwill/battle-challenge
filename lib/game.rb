require_relative 'player'
class Game
  attr_reader :player1, :player2
  def self.create(player1,player2)
    @game = Game.new(player1,player2)
  end
  def self.game_in_play
    @game
  end


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
  def opponent_of(the_player)
    players.select {|player| player != the_player}.first
  end
  def game_over?
    losing_player.any?
  end


private

  def losing_player
    players.select {|x| x.hit_points <= 0 }
  end

  attr_reader :players
end
