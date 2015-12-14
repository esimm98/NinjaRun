class Bird < Enemy

	TILE_WIDTH = 54
	TILE_HEIGHT = 56

	def initialize(img, side)
		super
		@animation = Gosu::Image::load_tiles(img, TILE_WIDTH, TILE_HEIGHT)
		@width = TILE_WIDTH
	end

	def draw
		@img = @animation[Gosu::milliseconds / 100 % @animation.size]
		super
	end

end