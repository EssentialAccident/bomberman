# frozen_string_literal: true

module Bomberman
  # CollisionDetection will be in charge of detecting collisions
  #   - Collision between Characters and Walls
  #   - Collision between characters
  class CollisionDetection
    # Detects collisions between a character and the map
    # char - Character
    # map  - Map of tiles
    def collision_character_map(char, map)
      map.tiles.each do |array|
        array.each do |tile|
          next unless char.position.x < tile.position.x + tile.width &&
                      char.position.x + char.width > tile.position.x &&
                      char.position.y < tile.height + tile.height &&
                      char.position.y + char.height > tile.position.y

          puts 'Collision'
          puts '---------'
        end
      end
    end
  end
end

#    rect1.x < rect2.x + rect2.width &&
#    rect1.x + rect1.width > rect2.x &&
#    rect1.y < rect2.y + rect2.height &&
#    rect1.y + rect1.height > rect2.y)
