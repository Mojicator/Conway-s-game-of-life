$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require 'game_of_life'
require 'minitest/autorun'

# Tools
module GenerateEnviromentConway
  def hardcoded_indexes(envi, arr = [])
    envi_temp = envi.dup
    arr.each do |element|
      envi[element[0]][element[1]] = 1
    end
    envi_temp
  end

  def build_enviroment(size_x, size_y)
    Array.new(size_y) { Array.new(size_x, 0) }
  end
end
