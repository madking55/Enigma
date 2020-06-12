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

  def test_it_returns_ending_index_hash
    expected = {" " => 11, "e" => 12, "n" => 13, "d" => 14 }
    assert_equal expected, @cracker.ending_index
  end

  def test_it_returns_ending_shift_keys
    expected = { " " => "D", "e" => "A", "n" => "B", "d" => "C" }
    assert_equal expected, @cracker.determine_ending_shift_keys
  end

  def test_it_returns_shift_values
    expected = { "A" => 8, "B" => 3, "C" => 0, "D" => 4 }
    assert_equal expected , @cracker.determine_shift_key_values
  end

  def test_it_returns_keys
    skip
    assert_equal "08304", @cracker.determine_key
  end
  
end