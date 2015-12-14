class Shrine < Enemy

	def initialize(img, side)
		super
		if side == 0
			@angle = 90
			@rot_point = 1.0
			@x = 50
		else
			@angle = -90
			@rot_point = 0.0
			@x = 400 - @height
		end
	end

	def draw
		@img.draw_rot(@x, @y, ZOrder::Enemies, @angle, 1.0, @rot_point)
	end

end