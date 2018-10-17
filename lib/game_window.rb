# This class will contain the main game loop
class GameWindow < Gosu::Window
  include Gosu

  def initialize(width, height)
    super width, height
    self.caption = 'Bomberman'
    @map = Map.new self
  end

  def update; end

  def draw
    @map.draw
  end

  def button_down(id)
    case id
    when KB_ESCAPE
      exit
    end
  end
end
