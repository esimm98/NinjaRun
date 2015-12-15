class Bird < Enemy

	TILE_WIDTH = 54
	TILE_HEIGHT = 56

	def initialize(img, side)
		@y = -100
		@side = side
		@animation = Gosu::Image::load_tiles(img, TILE_WIDTH, TILE_HEIGHT)
		@width = TILE_WIDTH
		set_side
		@move_start = rand(5..10) * 10
		@x_vel = rand(10..20) / 10.0
	end

	def draw
		@img = @animation[Gosu::milliseconds / 100 % @animation.size]
		super
	end

	def move
		super
		if @y >= @move_start
			left ? @x += @x_vel : @x -= @x_vel
		end
	end

end