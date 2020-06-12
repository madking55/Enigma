require_relative 'test_helper'
require './lib/key_cracker'

class KeyCrackerTest < Minitest::Test

  def setup
    @ciphertext = "vjqtbeaweqihssi"
    @date = "291018"
    @cracker = KeyCracker.new(@ciphertext, @date)
  end
  
  def test_it_exists
    assert_instance_of KeyCracker, @cracker
  end

  def test_it_returns_shift_offsets
    assert_equal [6, 3, 2, 4], @cracker.generate_offsets(@date)
  end

  def test_it_returns_shift_values
    assert_equal 20, @cracker.determine_shift_key_value
  end

  def test_it_returns_keys
    skip
    assert_equal "08304", @cracker.find_keys
  end
  
end