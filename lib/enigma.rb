class Enigma

  def todays_date
    Date.today.strftime("%d/%m/%Y")
  end

  def generate_key
    rand(9999).to_s.rjust(5, "0")
  end

  def encrypt(message, key = generate_key, date = todays_date)
    shift = ShiftGenerator.new(key, date).generate_shift_values
    shifted_message = MessageShifter.new(message, shift).shift_message
    generate_hash(shifted_message, key, date)
  end

  def generate_hash(shifted_message, key, date)
    {
      encryption: shifted_message,
      key: key,
      date: date
    }
  end
end