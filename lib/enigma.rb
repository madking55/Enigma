class Enigma

  attr_reader :message, :key, :date
  
  def initialize(message, key = generate_key, date = todays_date)
    @message = message
    @key = key
    @date = date
  end

  def todays_date
    Date.today.strftime("%d/%m/%Y")
  end

  def generate_key
    rand(9999).to_s.rjust(5, "0")
  end

  def encrypt(message, key, date)
    {
      encryption: MessageShifter.new(message, key, date).shift_message,
      key: key,
      date: date
    }
  end
end