# This class will contain the main game loop
class GameWindow < Gosu::Window
  include Gosu

  def initialize(width, height)
    super width, height
    self.caption = 'Bomberman'
    @map = Map.new self
    @player = Player.new self, 1, 1, Color::AQUA
  end

  def update; end

  def draw
    @map.draw
    @player.draw
  end

  def button_down(id)
    case id
    when KB_ESCAPE
      exit
    end
  end
end
