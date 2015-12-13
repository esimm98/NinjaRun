require_relative "player"
require_relative "wall"
require_relative "shield"
require_relative "enemy"
require_relative "bird"
require_relative "shrine"
require 'gosu'
require 'fastimage'

class Game < Gosu::Window

	def initialize
		super 450, 700
		self.caption = "Ninja Run"

		@background = Gosu::Image.new("media/background.png")
		@walls = [Wall.new("l_wall.png", 0), Wall.new("r_wall.png", 400)]
		@enemies = []

		@player = Player.new
		@player.warp(400, 550)
	end

	def update
		pick_enemy
		@enemies.each { |enemy| enemy.move }
	end

	def draw
		@background.draw(0, 0, ZOrder::Background)
		@walls.each { |wall| wall.draw }
		@enemies.each { |enemy| enemy.draw }
		@player.draw
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end

	private

		def pick_enemy
			if rand(100) < 20 && @enemies.size < 5
				type = rand(2)
				case type
				when 0
					@enemies << Bird.new("media/bird.png")
				when 1	
					@enemies << Shrine.new("media/shrine.png")			
				end
			end
		end

end

window = Game.new
window.show