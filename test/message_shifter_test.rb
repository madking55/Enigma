require_relative 'test_helper'
require './lib/message_shifter'

class MessageShifterTest < Minitest::Test

  def setup
    @shift = [3, 27, 73, 20]
  end
  
  def test_it_exists
    shifter = MessageShifter.new(message, @shift)
    assert_instance_of MessageShifter, shifter
  end
  
  def test_it_returns_chars_shifts
    message = "hello world"
    shifter = MessageShifter.new(message, @shift)
    expected = [3, 27, 73, 20, 3, 27, 73, 20, 3, 27, 73]
    assert_equal expected, shifter.chars_shifts
  end
  
  def test_it_can_shift_message
    message = "hello world"
    shifter = MessageShifter.new(message, @shift)
    assert_equal "keder ohulw", shifter.shift_message
  end
  
  def test_it_can_unshift_message
    message = "keder ohulw"
    shifter = MessageShifter.new(message, @shift)
    assert_equal "hello world", shifter.unshift_message
  end
  
  def test_it_can_shift_characters_not_in_charset
    message = "hello world!"
    shifter = MessageShifter.new(message, @shift)
    assert_equal "keder ohulw!", shifter.shift_message
  end
  
  def test_it_can_unshift_characters_not_in_charset
    message = "keder ohulw!"
    shifter = MessageShifter.new(message, @shift)
    assert_equal "hello world!", shifter.unshift_message
  end
end