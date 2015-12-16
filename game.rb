require_relative "player"
require_relative "wall"
require_relative "shield"
require_relative "enemy"
require_relative "bird"
require_relative "shrine"
require 'gosu'
require 'fastimage'

class Game < Gosu::Window

	def initialize
		super 450, 700
		self.caption = "Ninja Run"
		@game_over = false

		@background = Gosu::Image.new("media/background.png")
		@walls = [Wall.new("l_wall.png", 0), Wall.new("r_wall.png", 400)]
		@enemies = []

		@player = Player.new(370, 550)
	end

	def update
		@player.measure

		add_walls if @walls.size <= 4
		@walls.each { |wall| wall.move }
		@walls.reject! { |wall| true if wall.y > 700 }

		pick_enemy
		@enemies.each do |enemy|
			enemy.move
			enemy.measure
		end
		@enemies.reject! do |enemy|
			true if enemy.y >= 750
		end

		@player.collide(@enemies)
	end

	def draw
		@background.draw(0, 0, ZOrder::Background)
		@walls.each { |wall| wall.draw }
		@enemies.each { |enemy| enemy.draw }
		@player.draw
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end

	private

		def add_walls
			@walls << Wall.new("l_wall.png", 0, -700)
			@walls << Wall.new("r_wall.png", 400, -700)
		end

		def pick_enemy
			if @enemies.length < 5
				@type = rand(3)
				@side = rand(2)
				case @type
				when 0
					pick_side_image("bird.png")
					@enemies << Bird.new(@img, @side)
				when 1
					pick_side_image("shrine.png")
					@enemies << Shrine.new(@img, @side)
				when 2
					pick_side_image("enemy.png")
					@enemies << Enemy.new(@img, @side, rand(35..40) / 10.0)
				end
			end
		end

		def pick_side_image(file)
			@side == 0 ? @img = "media/l_" + file : @img = "media/r_" + file
		end

end

window = Game.new
window.show