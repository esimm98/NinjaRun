require 'gosu'

class Wall

	def initialize(img, x)
		@img = Gosu::Image.new(img)
		@x = x
		@y = 0
	end

	def draw
		@img.draw(@x, @y, 1)
	end

end