require_relative "zorder"

class Enemy

	attr_reader :x, :y, :semi_x, :semi_y, :mid_x, :mid_y

	def initialize(img, side, vel = 3)
		@y = rand(-10..-5) * 10
		@img = Gosu::Image.new(img)
		@width, @height = FastImage.size(img)
		@side = side
		set_side
		@y_vel = vel
	end

	def measure
		@semi_x = @width / 2.0
		@semi_y = @height / 2.0
		@mid_x = @x + @semi_x
		@mid_y = @y + @semi_y
	end

	def move
		@y += @y_vel
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