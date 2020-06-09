require './lib/enigma'
require_relative 'test_helper'
class EnigmaTest < Minitest::Test

  def setup 
    @enigma = Enigma.new
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
    skip
    expected =  {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }

  assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")                
  end
end