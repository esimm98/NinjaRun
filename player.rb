require_relative "powerup"
require 'gosu'

class Player
	attr_accessor :score

	def initialize
		@animation = Gosu::Image::load_tiles("player.png", 33, 36)
		@score = 0
	end

	def warp(x, y)
		@x, @y = x, y
	end

	def draw
		img = @animation[Gosu::milliseconds / 60 % @animation.size]
		img.draw_rot(@x, @y, 2, 270, 0.5, 1, 2.0, 2.0)
	end

	def jump

	end
end