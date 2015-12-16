require 'gosu'

class Player
	attr_accessor :score, :x, :y, :lives, :jumping

	def initialize(x, y)
		@l_animation = Gosu::Image::load_tiles("media/l_player.png", 55, 60)
		@r_animation = Gosu::Image::load_tiles("media/r_player.png", 55, 60)
		@lives = 3
		@x, @y = x, y
		@angle = 270
		@jumping = false
		@left = false
		@x_vel = 0
		@rot_vel = 0
	end

	def measure
		@semi_x = 55/2.0
		@semi_y = 60/2.0
		@mid_x = @x + @semi_x
		@mid_y = @y + @semi_y
	end

	def draw
		if @left
			@animation = @l_animation
		else
			@animation = @r_animation
		end
		img = @animation[Gosu::milliseconds / 60 % @animation.size]
		img.draw_rot(@x, @y, ZOrder::Player, @angle)
	end

	def collide(enemies)
		enemies.reject! do |enemy|
			if (@mid_x - enemy.mid_x).abs <= (@semi_x + enemy.semi_x - 10) && (@mid_y - enemy.mid_y).abs <= (@semi_y + enemy.semi_y - 10)
				@lives -= 1
				true
			end
		end
	end

	def move
		@x += @x_vel
		@angle += @rot_vel
		if @x <= 80
			@x_vel = 0
			@rot_vel = 0
			@left = true
		end
		if @x >= 370
			@x_vel = 0
			@rot_vel = 0
			@left = false
		end
	end

	def jump
		if @jumping
			$jump = true
			if @left
				@x_vel = 5
				@rot_vel = 3
			else
				@x_vel = -5
				@rot_vel = -3
			end
		end
		@jumping = false
		$jump = false
	end
	
end