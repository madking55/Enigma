require_relative 'test_helper'
require './lib/message_shifter'

class MessageShifterTest < Minitest::Test

  def setup
    @message = "hello world"
    @shift = [3, 27, 73, 20]
    @shifter = MessageShifter.new(@message, @shift)
  end
  
  def test_it_exists
    assert_instance_of MessageShifter, @shifter
  end

  def test_it_returns_chars_shifts
    expected = [3, 27, 73, 20, 3, 27, 73, 20, 3, 27, 73]
    assert_equal expected, @shifter.chars_shifts
  end

  def test_it_can_shift_message
    assert_equal "keder ohulw", @shifter.shift_message
  end
  
end