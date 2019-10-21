# frozen_string_literal: true

module Bomberman
  # Map will take care of the map
  class Map
    include Gosu

    attr_reader :tiles

    def initialize(size = 25)
      @size = size.even? ? size + 1 : size
      @tiles = generate_tiles @size
    end

    def draw(offset)
      @tiles.each do |array|
        array.each do |tile|
          tile.draw(offset)
        end
      end
    end

    # Returns the dimension in pixels of the Map
    def dimension
      @size * Tile::SIZE
    end

    private

    def generate_tiles(size)
      tiles = []
      size.times do |row|
        tiles[row] = []
        size.times do |column|
          tile_position = Vector2D.new row, column
          if row.zero? || column.zero? || row == size - 1 || column == size - 1
            tiles[row].push Tile.new tile_position, :wall
          elsif !row.zero? && !column.zero? && row.even? && column.even?
            tiles[row].push Tile.new tile_position, :wall
          elsif Gosu.random(0.0, 1.0) < 0.7 || (row == 1 && column == 1)
            tiles[row].push Tile.new tile_position, :empty
          else
            tiles[row].push Tile.new tile_position, :brick
          end
        end
      end
      tiles
    end
  end
end
