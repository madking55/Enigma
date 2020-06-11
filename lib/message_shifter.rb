class MessageShifter
  CHARS_SET = ("a".."z").to_a << " "

  def initialize(message, shift)
    @message = message
    @shift = shift
  end

  def shift_character(char, idx)
    new_char = nil
    if CHARS_SET.include?(char)
      char_idx_in_message = idx
      char_shift = @shift[0] if idx % 4 == 0
      char_shift = @shift[1] if idx % 4 == 1
      char_shift = @shift[2] if idx % 4 == 2
      char_shift = @shift[3] if idx % 4 == 3
      char_idx_in_charset = CHARS_SET.index(char)
      new_idx = char_idx_in_charset + char_shift
      new_char = CHARS_SET[new_idx % 27]
    else
      new_char = char
    end
    new_char
  end

  def shift_message
    shifted_message = ''
    @message.downcase.each_char.with_index do |char, idx|
      new_char = shift_character(char, idx)
      shifted_message += new_char
    end
    shifted_message
  end

  def unshift_character(char, idx)
    new_char = nil
    if CHARS_SET.include?(char)
      char_idx_in_message = idx
      char_shift = @shift[0] if idx % 4 == 0
      char_shift = @shift[1] if idx % 4 == 1
      char_shift = @shift[2] if idx % 4 == 2
      char_shift = @shift[3] if idx % 4 == 3
      char_idx_in_charset = CHARS_SET.index(char)
      new_idx = char_idx_in_charset - char_shift
      new_char = CHARS_SET[new_idx % 27]
    else
      new_char = char
    end
    new_char
  end

  def unshift_message
   unshifted_message = '' 
   @message.each_char.with_index do |char, idx|
    new_char = unshift_character(char, idx)
    unshifted_message += new_char
   end
   unshifted_message
  end
end