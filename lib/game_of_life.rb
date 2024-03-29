require 'gosu'
require_relative './game_of_life/version'
require_relative './game_of_life/envi'

# Graphic mode - Conway's game of life
module GameOfLifeOM
  # Show something
  class GameOfLife < Gosu::Window
    SIZE = 10
    WINDOW_X = 1200
    WINDOW_Y = 700
    ENVI_X = Integer(WINDOW_X / SIZE)
    ENVI_Y = Integer(WINDOW_Y / SIZE)
    PERCENTAGE_POPULATION = 0.30
    INITIAL_CELLS = Integer(ENVI_X * ENVI_Y * PERCENTAGE_POPULATION)
    GENERATIONS = 500
    DELAY = 0.3
    CELL_ALIVE = 0xff_ffffff
    CELL_DEAD = 0xff_000000

    def initialize
      super(WINDOW_X, WINDOW_Y, false)
      self.caption = "Conway's game of life by Mojicator"
      @enviroment = Envi.new(INITIAL_CELLS, GENERATIONS, ENVI_Y, ENVI_X)
      @enviroment.delay = DELAY
    end

    def needs_cursor?
      true
    end

    def update
      @enviroment.run_game
    end

    def needs_redraw?
      @enviroment.gen >= 0
    end

    def draw
      @enviroment.max_y.times do |abs|
        @enviroment.max_x.times do |ord|
          # y = abs * SIZE
          # x = ord * SIZE
          x = abs * SIZE
          y = ord * SIZE
          case @enviroment.enviroment[abs][ord]
          when 0
            draw_quad(x, y, CELL_DEAD, x + SIZE, y, CELL_DEAD,
                      x + SIZE, y + SIZE, CELL_DEAD, x, y + SIZE, CELL_DEAD)
          when 1
            draw_quad(x, y, CELL_ALIVE, x + SIZE, y, CELL_ALIVE,
                      x + SIZE, y + SIZE, CELL_ALIVE, x, y + SIZE, CELL_ALIVE)
          end
        end
      end
    end
  end

  def self.run
    GameOfLife.new.show
  end
end
