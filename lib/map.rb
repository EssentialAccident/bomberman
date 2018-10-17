# Map will take care of the map
class Map
  include Gosu

  def initialize(window, size = 10)
    @window = window
    @size = size.even? ? size + 1 : size
    @tiles = generate_tiles @size
  end

  def update; end

  def draw
    @size.times do |row|
      @size.times do |column|
        @tiles[row][column].draw
      end
    end
  end

  class Tile
    include Gosu

    TYPE = { empty: 0,
             brick: 1,
             wall: 2 }.freeze
    IMG = { empty:
              Image.new('media/sprites/blocks/floor.png',
                        tileable: true),
            brick: Image.new('media/sprites/blocks/bomberman-brick.png',
                             tileable: true),
            wall: Image.new('media/sprites/blocks/bomberman-wall.png',
                            tileable: true) }.freeze

    attr_reader :type

    def initialize(x, y, type)
      @x = x
      @y = y
      @type = type
      @img = IMG[@type]
    end

    def update; end

    def draw
      @img.draw @x * @img.width, @y * @img.height, 50
    end
  end

  private

  def generate_tiles(size)
    tiles = []
    size.times do |row|
      tiles[row] = []
      size.times do |column|
        if row.zero? || column.zero? || row == size - 1 || column == size - 1
          tiles[row].push Tile.new row, column, :wall
        elsif !row.zero? && !column.zero? && row.even? && column.even?
          tiles[row].push Tile.new row, column, :wall
        elsif Gosu.random(0.0, 1.0) < 0.5
          tiles[row].push Tile.new row, column, :empty
        else
          tiles[row].push Tile.new row, column, :brick
        end
      end
    end
    tiles
  end
end
