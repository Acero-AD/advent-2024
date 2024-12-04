require 'minitest/autorun'

require_relative 'hysterian'

describe Hysterian do
  before do
    @temp_file = Tempfile.new('test.txt')
    @temp_file.write(lines)
    @temp_file.close
  end

  subject { Hysterian.new(@temp_file.path) }

  let(:lines) do
    <<~TXT
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
    TXT
  end

  it 'should return the difference between the two columns' do
    assert_equal(11, subject.run)
  end
end
