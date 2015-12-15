require 'gosu'

class Wall

	attr_reader :y

	def initialize(img, x, y = 0)
		@img = Gosu::Image.new("media/#{img}")
		@x = x
		@y = y
	end

	def draw
		@img.draw(@x, @y, ZOrder::Walls)
	end

	def move
		@y += 2
	end

end