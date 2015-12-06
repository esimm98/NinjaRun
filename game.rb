require_relative "player"
require_relative "wall"
require_relative "powerup"
require_relative "shield"
require 'gosu'

class Game < Gosu::Window

	def initialize
		super 450, 700
		self.caption = "Ninja Run"

		@background = Gosu::Image.new("background.png")
		@walls = [Wall.new("l_wall.png", 0), Wall.new("r_wall.png", 387)]

		@player = Player.new
		@player.warp(387, 550)
	end

	def update

	end

	def draw
		@background.draw(0, 0, 0)
		@walls.each { |wall| wall.draw }
		@player.draw
	end

	def button_down(id)
		close if id = Gosu::KbEscape
	end
end

window = Game.new
window.show