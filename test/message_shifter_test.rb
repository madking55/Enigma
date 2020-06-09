require_relative 'test_helper'
require './lib/message_shifter'
require './lib/enigma'

class MessageShifterTest < Minitest::Test

  def setup
    @message = "hello world"
    # @key = "02715"
    # @date = "040895"
    @encrypted = "keder ohulw"
    @shifter = MessageShifter.new(@message, @key, @date)
  end
  
  def test_it_exists
    assert_instance_of MessageShifter, @shifter
  end

  def test_it_returns_chars_shifts
    expected = [3, 27, 73, 20, 3, 27, 73, 20, 3, 27, 73]
    assert_equal expected, @shift.chars_shifts
  end

  def test_it_can_shift_message
    assert_equal @encrypted, @shifter.shift_message
  end
  
end