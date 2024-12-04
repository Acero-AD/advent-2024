# frozen_string_literal: true

class Hysterian
  def initialize(filename)
    @filename = filename
    @lines = File.readlines(filename)
  end

  def run
    col1 = []
    col2 = []
    @lines.each do |line|
      colums = line.split.map(&:to_i)
      col1.push(colums[0])
      col2.push(colums[1])
    end
    difference(col1.sort, col2.sort)
  end

  def difference(col1, col2)
    col1.zip(col2).map { |a, b| (a - b).abs }.sum
  end
end

if __FILE__ == $PROGRAM_NAME
  obj = Hysterian.new('elments.txt')
  puts obj.run
end
