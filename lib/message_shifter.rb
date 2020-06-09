class MessageShifter
  attr_reader :message, :key, :date, :characters_set

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @characters_set = ("a".."z").to_a << " "
  end

  def generate_keys(key)
    keys = []
    keys[0] = key[0..1].to_i
    keys[1] = key[1..2].to_i
    keys[2] = key[2..3].to_i
    keys[3] = key[3..4].to_i
    keys
  end

  def generate_offsets(date)
    squared = date.to_i ** 2
    offsets = squared.digits.reverse[-4..-1]
  end

  def generate_shifts
    keys = generate_keys(key)
    offsets = generate_offsets(date)
    shifts = []
    shifts[0] = keys[0] + offsets[0]
    shifts[1] = keys[1] + offsets[1]
    shifts[2] = keys[2] + offsets[2]
    shifts[3] = keys[3] + offsets[3]
    shifts
  end

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

  def shift_message
    encrypted_message = ''
    @message.each_char.with_index do |char, idx|
      char_idx_in_message = idx
      char_shift = chars_shifts[char_idx_in_message]
      char_idx_in_charset = @characters_set.index(char)
      new_idx = char_idx_in_charset + char_shift
      new_char = @characters_set[new_idx % 27]
      encrypted_message += new_char
    end
    encrypted_message
  end
end