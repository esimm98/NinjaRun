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
		$score = 0
		@score_back = Gosu::Image.new("media/score_back.jpg")

		@background = Gosu::Image.new("media/background.png")
		@walls = [Wall.new("l_wall.png", 0), Wall.new("r_wall.png", 400)]
		@enemies = []

		@player = Player.new(370, 550)
		$jump = false

		@font = Gosu::Font.new(40)
	end

	def update
		add_walls if @walls.size <= 4
		@walls.each { |wall| wall.move }
		@walls.reject! { |wall| true if wall.y > 700 }

		@player.move
		@player.measure
		if Gosu::button_down? Gosu::KbSpace
			if !$jump
				@player.jumping = true
				@player.jump
			end
		end

		pick_enemy
		@enemies.each do |enemy|
			enemy.move
			enemy.measure
		end
		@enemies.reject! do |enemy|
			true if enemy.y >= 750
		end

		@player.collide(@enemies)
		$score += 1
	end

	def draw
		@background.draw(0, 0, ZOrder::Background)
		if !game_over?
			@walls.each { |wall| wall.draw }
			@enemies.each { |enemy| enemy.draw }
			@player.draw
			@font.draw("Lives:", 100, 650, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
			for n in 1..@player.lives
				img = Gosu::Image.new("media/life.png")
				img.draw(150 + 55 * n, 650, ZOrder::UI)
			end

			@score_back.draw(145, 0, ZOrder::UI)
			@font.draw($score, 175, 5, ZOrder::UI, 1.0, 1.0, 0xff_000000)
		else
			@font.draw("GAME OVER", 10, 300, ZOrder::UI, 2.0, 2.0, 0xff_ffff00)
		end
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end

	private

		def game_over?
			@player.lives <= 0
		end

		def add_walls
			@walls << Wall.new("l_wall.png", 0, -700)
			@walls << Wall.new("r_wall.png", 400, -700)
		end

		def pick_enemy
			if @enemies.length < 2
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