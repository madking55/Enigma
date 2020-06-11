class MessageShifter
  CHARS_SET = ("a".."z").to_a << " "

  def initialize(message, shift)
    @message = message
    @shift = shift
  end

  def chars_shifts
    # determine the shift to apply based on char index
    sliced_message = @message.chars.each_slice(4).to_a
    chars_shifts = []
    sliced_message.each do |array|
      array.each_with_index do |char, idx|
        chars_shifts << @shift[idx]
      end  
    end
    chars_shifts
  end

  # TODO: make it work for uppercase letters and characters not included inCHARS_SET
  def shift_message
    shifted_message = ''
    @message.each_char.with_index do |char, idx|
      if CHARS_SET.include?(char)
        char_idx_in_message = idx
        char_shift = chars_shifts[char_idx_in_message]
        char_idx_in_charset = CHARS_SET.index(char)
        new_idx = char_idx_in_charset + char_shift
        new_char = CHARS_SET[new_idx % 27]
      else
        new_char = char
      end
      shifted_message += new_char
    end
    shifted_message
  end

  def unshift_message
   unshifted_message = '' 
   @message.each_char.with_index do |char, idx|
    if CHARS_SET.include?(char)
      char_idx_in_message = idx
      char_shift = chars_shifts[char_idx_in_message]
      char_idx_in_charset = CHARS_SET.index(char)
      new_idx = char_idx_in_charset - char_shift
      new_char = CHARS_SET[new_idx % 27]
    else
      new_char = char
    end
    unshifted_message += new_char
   end
   unshifted_message
  end
end