require_relative "zorder"
require 'fastimage'

class Enemy

	def initialize(img, side)
		@y = -100
		@img = Gosu::Image.new(img)
		@width, @height = FastImage.size(img)
		@side = side
	end

	def move
		@y += 2
	end

	def draw
		set_side
		@img.draw(@x, @y, ZOrder::Enemies)
	end

	private

		def set_side
			@side == 0 ? @x = 50 : @x = 400 - @width
		end

end