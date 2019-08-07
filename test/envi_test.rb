# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/game_of_life/envi'
require_relative '../lib/game_of_life/cell'

describe Envi do
  before do
    @envi = Envi.new(5, 0.2, 5, 5)
    #  █
    #   █
    # ███
  end
  # describe '#dewey' do
  # end
end
