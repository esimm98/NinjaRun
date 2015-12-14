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

		@background = Gosu::Image.new("media/background.png")
		@walls = [Wall.new("l_wall.png", 0), Wall.new("r_wall.png", 400)]
		@enemies = []

		@player = Player.new
		@player.warp(400, 550)
	end

	def update
		pick_enemy
		@enemies.each { |enemy| enemy.move }
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

		def pick_enemy
			if @enemies.length < 10
				@type = rand(3)
				@side = rand(2)
				case @type
				when 0
					pick_side_image("bird.png")
					@enemies << Bird.new(@img, @side)
				when 1
					@enemies << Shrine.new("media/shrine.png", @side)
				when 2
					pick_side_image("enemy.png")
					@enemies << Enemy.new(@img, @side)
				end
			end
		end

		def pick_side_image(file)
			@side == 0 ? @img = "media/l_" + file : @img = "media/r_" + file
		end

end

window = Game.new
window.show