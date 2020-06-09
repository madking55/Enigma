require_relative 'test_helper'
require './lib/message_shifter'

class MessageShifterTest < Minitest::Test

  def setup
    @message = "hello world"
    @key = "02715"
    @date = "040895"
    @encrypted = "keder ohulw"
    @shifter = MessageShifter.new(@message, @key, @date)
  end
  
  def test_it_exists
    assert_instance_of MessageShifter, @shifter
  end

  def test_it_has_attributes
    assert_equal "hello world", @shifter.message
    assert_equal "02715", @shifter.key
    assert_equal "040895", @shifter.date
    assert_equal 27, @shifter.characters_set.length
  end

  def test_it_can_generate_keys
    assert_equal [02, 27, 71, 15], @shifter.generate_keys(@key)
  end

  def test_it_can_generate_offsets
    assert_equal [1, 0, 2, 5], @shifter.generate_offsets(@date)
  end

  def test_it_can_generate_shifts
    assert_equal [3, 27, 73, 20], @shifter.generate_shifts
  end

  def test_it_returns_chars_shifts
    expected = [3, 27, 73, 20, 3, 27, 73, 20, 3, 27, 73]
    assert_equal expected, @shifter.chars_shifts
  end

  def test_it_can_shift_character
    encrypted = "k"
    assert_equal encrypted, @shifter.shift_character
  end

  def test_it_can_shift_message
    skip
    assert_equal @encrypted.chars, @shifter.shift_message
  end
  
end