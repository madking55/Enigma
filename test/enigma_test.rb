require './lib/enigma'
require './lib/message_shifter'
require './lib/shift_generator'
require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def setup 
    @enigma = Enigma.new
    @encrypted =  
                {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }
  end
  
  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_get_todays_date
    todays_date = Date.new(1995, 8, 04)
    Date.stubs(:today).returns(todays_date)
    assert_equal '040895', @enigma.todays_date
  end

  def test_it_can_generate_key
    @enigma.stubs(:generate_key).returns("02715")
    assert_equal "02715", @enigma.generate_key
  end
  
  def test_it_can_encrypt_message_with_key_and_date
    assert_equal @encrypted, @enigma.encrypt("hello world", "02715", "040895")                
  end
  
  def test_it_can_encrypt_message_without_date
    todays_date = Date.new(1995, 8, 04)
    Date.stubs(:today).returns(todays_date)
    assert_equal @encrypted, @enigma.encrypt("hello world", "02715")                
  end
  
  def test_it_can_encrypt_message_without_key_and_date
    todays_date = Date.new(1995, 8, 04)
    Date.stubs(:today).returns(todays_date)
    @enigma.stubs(:generate_key).returns("02715")
    assert_equal @encrypted, @enigma.encrypt("hello world")                
  end

  def test_it_can_decrypt_message
    todays_date = Date.new(1995, 8, 04)
    Date.stubs(:today).returns(todays_date)
    decrypted = 
              {
                decryption: "hello world",
                key: "02715",
                date: "040895"            
              } 
    assert_equal decrypted, @enigma.decrypt("keder ohulw", "02715")
  end

  def test_it_can_crack_encryption_with_date
    cracked =  
            {
              decryption: "hello world end",
              key: "08304",
              date: "291018"
            }
    assert_equal cracked, @enigma.crack("vjqtbeaweqihssi", "291018")
  end

  def test_it_can_crack_without_date
  end
end