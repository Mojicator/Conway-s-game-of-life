# frozen_string_literal: true

require 'minitest/autorun'
require_relative './test_helper'
require_relative '../lib/game_of_life/envi'

describe Envi do
  include GenerateEnviromentConway
  SIZE_X = 5
  SIZE_Y = 5
  before do
    @conway = Envi.new(0, 0, SIZE_X, SIZE_Y)
    @conway.testing = true
  end
  it 'runs glider pattern step 1' do
    cells = [[0, 1], [1, 2], [2, 0], [2, 1], [2, 2]]
    @conway.enviroment = hardcoded_indexes(@conway.enviroment, cells)
    @conway.run_game
    cells_expected = [[1, 0], [1, 2], [2, 1], [2, 2], [3, 1]]
    conway_expected = build_enviroment(SIZE_X, SIZE_Y)
    resp = hardcoded_indexes(conway_expected, cells_expected)
    resp.must_equal @conway.enviroment
  end
  it 'runs glider pattern step 2' do
    cells = [[1, 0], [1, 2], [2, 1], [2, 2], [3, 1]]
    @conway.enviroment = hardcoded_indexes(@conway.enviroment, cells)
    @conway.run_game
    cells_expected = [[1, 2], [2, 0], [2, 2], [3, 1], [3, 2]]
    conway_expected = build_enviroment(SIZE_X, SIZE_Y)
    resp = hardcoded_indexes(conway_expected, cells_expected)
    resp.must_equal @conway.enviroment
  end
  it 'runs glider pattern step 3' do
    cells = [[1, 2], [2, 0], [2, 2], [3, 1], [3, 2]]
    @conway.enviroment = hardcoded_indexes(@conway.enviroment, cells)
    @conway.run_game
    cells_expected = [[1, 1], [2, 2], [2, 3], [3, 1], [3, 2]]
    conway_expected = build_enviroment(SIZE_X, SIZE_Y)
    resp = hardcoded_indexes(conway_expected, cells_expected)
    resp.must_equal @conway.enviroment
  end
  it 'runs glider pattern step 4' do
    cells = [[1, 1], [2, 2], [2, 3], [3, 1], [3, 2]]
    @conway.enviroment = hardcoded_indexes(@conway.enviroment, cells)
    @conway.run_game
    cells_expected = [[1, 2], [2, 3], [3, 1], [3, 2], [3, 3]]
    conway_expected = build_enviroment(SIZE_X, SIZE_Y)
    resp = hardcoded_indexes(conway_expected, cells_expected)
    resp.must_equal @conway.enviroment
  end
end
