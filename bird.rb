class Bird < Enemy

	TILE_WIDTH = 54
	TILE_HEIGHT = 56

	def initialize(img)
		super
		@animation = Gosu::Image::load_tiles(img, TILE_WIDTH, TILE_HEIGHT)
		@x_rad = TILE_WIDTH / 2.0
	end

	def draw
		@img = @animation[Gosu::milliseconds / 100 % @animation.size]
		super
	end

end