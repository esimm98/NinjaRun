require 'gosu'

class Player
	attr_accessor :score, :x, :y, :lives, :jumping, :shield, :mid_x, :mid_y

	def initialize(x, y)
		@l_animation = Gosu::Image::load_tiles("media/l_player.png", 55, 60)
		@r_animation = Gosu::Image::load_tiles("media/r_player.png", 55, 60)
		@lives = 3
		@x = x
		@y = y
		@angle = 270
		@jumping = false
		@left = false
		@shield = false
		@x_vel = 0
		@rot_vel = 0
		@shield_animation = Gosu::Image::load_tiles("media/shield.png", 80, 80)
	end

	def measure
		@semi_x = 55 / 2.0
		@semi_y = 60 / 2.0
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

		if @shield
			shield_img = @shield_animation[Gosu::milliseconds / 100 % @shield_animation.size]
			shield_img.draw(@mid_x- 75, @mid_y - 70, ZOrder::Shield)
		end
	end

	def collide_enemy(enemies)
		enemies.reject! do |enemy|
			if (@mid_x - enemy.mid_x).abs <= (@semi_x + enemy.semi_x) && (@mid_y - enemy.mid_y).abs <= (@semi_y + enemy.semi_y)
				true
				lives = @lives
				if !@shield
					lives -= 1
					$score -= 100
				else
					@shield = false
					lives = @lives
				end
				@lives = lives
			end
		end
	end

	def pickup(powerup)
		if (@mid_x - powerup.mid_x).abs <= (@semi_x + powerup.semi) && (@mid_y - powerup.mid_y).abs <= (@semi_y + powerup.semi)
			powerup.reset
			@shield = true
			true
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
				@x_vel = 8
				@rot_vel = 5
			else
				@x_vel = -8
				@rot_vel = -5
			end
		end
		@jumping = false
		$jump = false
	end
	
end