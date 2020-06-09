class MessageShifter
  CHARS_SET = ("a".."z").to_a << " "

  
  # attr_reader :message, :key, :date, :characters_set

  # def initialize(message, key, date)
  #   @message = message
  #   @key = key
  #   @date = date
  # end

  def chars_shifts
    # determine the shift to apply based on char index
    sliced_message = @message.chars.each_slice(4).to_a
    chars_shifts = []
    sliced_message.each do |array|
      array.each_with_index do |char, idx|
        chars_shifts << generate_shifts[idx]
      end  
    end
    chars_shifts
  end

  # TODO: make it work for uppercase letters and characters not included inCHARS_SET
  def shift_message
    encrypted_message = ''
    @message.each_char.with_index do |char, idx|
      char_idx_in_message = idx
      char_shift = chars_shifts[char_idx_in_message]
      char_idx_in_charset = CHARS_SET.index(char)
      new_idx = char_idx_in_charset + char_shift
      new_char = CHARS_SET[new_idx % 27]
      encrypted_message += new_char
    end
    encrypted_message
  end
end