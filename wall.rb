require 'gosu'

class Wall

	def initialize(img, x)
		@img = Gosu::Image.new("media/#{img}")
		@x = x
		@y = 0
	end

	def draw
		@img.draw(@x, @y, ZOrder::Walls)
	end

end