require 'gosu'

class Player
	attr_accessor :score, :x, :y

	def initialize(x, y)
		@animation = Gosu::Image::load_tiles("media/r_player.png", 55, 60)
		@score = 0
		@lives = 3
		@x, @y = x, y
		@semi_x = 55/2.0
		@semi_y = 60/2.0
		@mid_x = @x + @semi_x
		@mid_y = @y + @semi_y
	end

	def measure

	end

	def draw
		img = @animation[Gosu::milliseconds / 60 % @animation.size]
		img.draw_rot(@x, @y, ZOrder::Player, 270)
	end

	def collide(enemies)
		enemies.reject! do |enemy|
			if (@mid_x - enemy.mid_x).abs <= (@semi_x + enemy.semi_x) && (@mid_y - enemy.mid_y).abs <= (@semi_y + enemy.semi_y)
				@lives -= 1
				true
			end
		end
	end

	def jump

	end
	
end