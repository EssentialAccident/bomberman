# frozen_string_literal: true

module Bomberman
  # Tile handles individual tiles
  # Tiles can be 1 of three possibilities
  #   - Wall  = Cannot be destroyed by bombs
  #   - Brick = Can be destroyed by bomb
  #   - Empty = Walking space
  class Tile < Sprite
    include Gosu

    SIZE = 64
    Z_ORDER = 10
    TYPE = { empty: 0,
             brick: 1,
             wall: 2 }.freeze
    IMG = { empty: Image.new('media/sprites/blocks/bomberman-floor.png',
                             tileable: true),
            brick: Image.new('media/sprites/blocks/bomberman-brick.png',
                             tileable: true),
            wall: Image.new('media/sprites/blocks/bomberman-interior-wall.png',
                            tileable: true) }.freeze

    attr_reader :type

    def initialize(position, type)
      @type = type
      super position.multiply_scalar(SIZE), IMG[@type], Z_ORDER
    end
  end
end
