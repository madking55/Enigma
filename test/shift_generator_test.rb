require_relative 'test_helper'
require './lib/message_shifter'
require './lib/shift_generator'

class ShiftGeneratorTest < Minitest::Test

  def setup
    @key = "02715"
    @date = "040895"
    @shift = ShiftGenerator.new(@key, @date)
  end
  
  def test_it_exists
    assert_instance_of ShiftGenerator, @shift
  end

  def test_it_has_attributes
    assert_equal "02715", @shift.key
    assert_equal "040895", @shift.date
  end

  def test_it_can_generate_keys
    assert_equal [02, 27, 71, 15], @shift.generate_keys(@key)
  end

  def test_it_can_generate_offsets
    assert_equal [1, 0, 2, 5], @shift.generate_offsets(@date)
  end

  def test_it_can_generate_shifts
    assert_equal [3, 27, 73, 20], @shift.generate_shifts
  end


  
end