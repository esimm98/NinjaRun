require_relative "zorder"
require 'fastimage'

class Enemy

	def initialize(img)
		@side = rand(2)
		@left = true
		@y = -200
		@img = Gosu::Image.new(img)
		@x_rad = FastImage.size(img)[0] / 2.0
		set_side
	end

	def move
		@y += 1
	end

	def draw
		@img.draw(@x, @y, ZOrder::Enemies)
	end

	private

		def set_side
			@side == 0 ? @left : !@left
			@left ? @x = 50 - @x_rad : @x = 400 + @x_rad
		end

end