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
    today.expects(:strftime).returns('030620')

    assert_equal '030620', @enigma.todays_date
  end

  def test_it_can_generate_key
    srand(1111)
    assert_equal "68325", @enigma.generate_key
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