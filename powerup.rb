class Powerup

	attr_reader :semi, :mid_x, :mid_y, :x, :y

	def initialize
		@side = rand(2)
		@size = 60
		set_side
		@y = -3000
		@animation = Gosu::Image::load_tiles("media/pickup.png", @size, @size)
	end

	def measure
		@semi = 20.0
		@mid_x = @x + @semi
		@mid_y = @y + @semi
	end

	def reset
		initialize
	end

	def move
		@y += 3
	end

	def draw
		img = @animation[Gosu::milliseconds / 100 % @animation.size]
		img.draw(@x, @y, ZOrder::Shield)
	end

	private

		def left
			@side == 0
		end

		def set_side
			left ? @x = 50 : @x = 400 - @size
		end

end