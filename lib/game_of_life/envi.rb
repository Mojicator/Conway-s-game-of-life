# frozen_string_literal: false

require 'os'
require_relative './cell'

# terminal enviroment
class Envi
  attr_accessor :max_x, :max_y, :enviroment
  attr_reader :withe_list, :black_list

  # Format: [j, i]
  # [j-1, i-1] [j-1, i  ] [j-1, i+1]
  # [j  , i-1] [j  , i  ] [j  , i+1]
  # [j+1, i-1] [j-1, i  ] [j+1, i+1]
  RULE = [[-1, -1], [-1, 0], [-1, 1], [0, 1],
          [1, 1], [1, 0], [1, -1], [0, -1]].freeze

  def initialize(cells = 50, delay = 0.2, dim_x = 60, dim_y = 20)
    @max_x = dim_x
    @max_y = dim_y
    @cells = cells
    @delay = delay
    @enviroment = Array.new(@max_y) { Array.new(@max_x, Cell.new(false)) }
    @withe_list = []
    @black_list = []
    plant_cells
  end

  def to_print
    @enviroment.each do |row|
      row.each do |item|
        case item.state
        when false then print '.'
        when true then print '█'
        end
      end
      puts
    end
  end

  def fix_position(abs_ord, item, value, max)
    abs_ord + RULE[item][value] > max - 1 ? 0 : abs_ord + RULE[item][value]
  end

  def neighborhood(abs, ord)
    neighbours = 0
    RULE.length.times do |item|
      # abs_aux = abs + RULE[item][0]
      # ord_aux = ord + RULE[item][1]
      # abs_aux = 0 if abs_aux > @max_y - 1
      # ord_aux = 0 if ord_aux > @max_x - 1
      abs_aux = fix_position(abs, item, 0, max_y)
      ord_aux = fix_position(ord, item, 1, max_x)
      neighbours += 1 if @enviroment[abs_aux][ord_aux].state
    end
    neighbours
  end

  def dewey
    @max_y.times do |jndex|
      @max_x.times do |index|
        if neighborhood(jndex, index).equal?(3)
          @withe_list.push([jndex, index])
        elsif neighborhood(jndex, index) > 3 || neighborhood(jndex, index) < 2
          @black_list.push([jndex, index])
        end
      end
    end
  end

  def you_are_alive
    @withe_list.each do |item|
      @enviroment[item[0]][item[1]] = Cell.new(true)
    end
    @withe_list = []
  end

  def you_are_dead
    @black_list.each do |item|
      @enviroment[item[0]][item[1]] = Cell.new(false)
    end
    @black_list = []
  end

  def run_game
    dewey
    you_are_alive
    you_are_dead
    sleep @delay
  end

  def terminal_mode
    to_print
    run_game
    OS.windows? ? system('cls') : system('clear')
  end

  def plant_cells
    @cells.times { @enviroment[rand(@max_y)][rand(@max_x)] = Cell.new(true) }
    # @enviroment[0][1] = Cell.new(true)
    # @enviroment[1][2] = Cell.new(true)
    # @enviroment[2][0] = Cell.new(true)
    # @enviroment[2][1] = Cell.new(true)
    # @enviroment[2][2] = Cell.new(true)
  end
end
