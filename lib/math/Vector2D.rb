# Vector2D will handle a vector for easier posiitoning
# of coordinates in the space
class Vector2D
  attr_accessor :x_coordinate, :y_coordinate

  # The default value of a vector will be an empty
  # vector
  def initialize(x_coordinate = 0, y_coordinate = 0)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end

  def to_s
    "#{x}, #{y}"
  end

  def +(another)
    if another.is_a?(Vector2D)
      Vector2D.new @x_coordinate + another.x_coordinate,
                   @y_coordinate + another.y_coordinate
    end
  end

  def -(another)
    if another.is_a?(Vector2D)
      Vector2D.new @x_coordinate - another.x_coordinate,
                   @y_coordinate - another.y_coordinate
    end
  end

  def ==(another)
    if another.is_a?(Vector2D)
      @x_coordinate == another.x_coordinate &&
        @y_coordinate == another.y_coordinate ? true : false
    end
  end

  def *(_number)
    Vector2D.new @x_coordinate * 64,
                 @y_coordinate * 64
  end
end
