# frozen_string_literal: true

module Bomberman
  # Title handles the title on top of the Game
  class Title
    include Gosu

    Z_ORDER = 20

    attr_reader :width, :height
    def initialize(width, height)
      @width = width
      @height = height
    end

    def draw
      draw_rect 0, 0, @width, @height, Gosu::Color::GRAY, Z_ORDER
      draw_rect 0, @height - 2, @width, 2, Gosu::Color::BLACK, Z_ORDER + 1
    end
  end
end
