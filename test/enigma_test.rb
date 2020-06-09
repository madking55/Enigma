require './lib/enigma'
require './lib/message_shifter'
require_relative 'test_helper'
class EnigmaTest < Minitest::Test

  def setup 
    @enigma = Enigma.new
    @encrypted =  {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
  end
  
  def test_it_exists
    assert_instance_of Enigma, @enigma
  end
  
  def test_it_can_get_todays_date
    today = mock('date object')
    Date.expects(:today).returns(today)
    today.expects(:strftime).returns('040895')

    assert_equal '040895', @enigma.todays_date
  end

  def test_it_can_generate_key
    @enigma.stubs(:generate_key).returns("02715")
    assert_equal "02715", @enigma.generate_key
  end

  def test_it_can_encrypt_message_with_key_and_date
  assert_equal @encrypted, @enigma.encrypt("hello world", "02715", "040895")                
  end

  # TODO
  def test_it_can_encrypt_message_without_date
    skip
    assert_equal @encrypted, @enigma.encrypt("hello world", "02715")                
  end

  # TODO
  def test_it_can_encrypt_message_without_key_and_date
    skip
    assert_equal @encrypted, @enigma.encrypt("hello world")                
  end
end