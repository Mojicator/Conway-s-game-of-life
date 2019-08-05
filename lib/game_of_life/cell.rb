# frozen_string_literal: true

# Cell description
class Cell
  attr_accessor :state, :neighbours

  def initialize(state)
    @state = state
    # @neighbours = 0
  end

  def self.am_i_live?
    @state == true
  end
end
