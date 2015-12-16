class Bird < Enemy

	def initialize(img, side)
		@y = -100
		@width = 54
		@height = 56
		@side = side
		@animation = Gosu::Image::load_tiles(img, @width, @height)
		set_side
		@y_vel = 3
		@x_vel = 2
	end

	def draw
		@img = @animation[Gosu::milliseconds / 100 % @animation.size]
		super
	end

	def move
		super
		if @y >= 70
			left ? @x += @x_vel : @x -= @x_vel
		end
	end

end