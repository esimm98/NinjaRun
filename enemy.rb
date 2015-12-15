require_relative "zorder"
require 'fastimage'

class Enemy

	attr_reader :x, :y

	def initialize(img, side)
		@y = -100
		@img = Gosu::Image.new(img)
		@width, @height = FastImage.size(img)
		@side = side
		set_side
	end

	def move
		@y += 2
	end

	def draw
		@img.draw(@x, @y, ZOrder::Enemies)
	end

	private

		def left
			@side == 0
		end

		def set_side
			left ? @x = 50 : @x = 400 - @width
		end

end