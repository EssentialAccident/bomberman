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

  def self.zero
    Vector2D.new(0, 0)
  end

  def to_s
    "#{x_coordinate}, #{y_coordinate}"
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

  def *(number)
    Vector2D.new @x_coordinate * number,
                 @y_coordinate * number
  end
end
