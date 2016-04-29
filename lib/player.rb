class Player
  DEFAULT_HIT_POINTS = 100
  attr_reader :name, :hit_points

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def receive_damage
    @hit_points -= 10
  end

  def receive_damage_rand
    @hit_points -= rand(1..11)
  end


end



pla = Player.new("harry")
pla.receive_damage
p pla.hit_points