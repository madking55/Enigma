class KeyCracker
  CHARS_SET = ("a".."z").to_a << " "

  def initialize(ciphertext, date)
    @ciphertext = ciphertext
    @date = date
  end

  def generate_offsets(date)
    squared = date.to_i ** 2
    @offsets = squared.digits.reverse[-4..-1]
  end


  def ending_index
    # determine char_idx_in_ciphertext
    ending_idx = {
       " " => @ciphertext.length - 4, 
       "e" => @ciphertext.length - 3, 
       "n" => @ciphertext.length - 2, 
       "d" => @ciphertext.length - 1}
  end


  def determine_ending_shift_keys
    # which shift key has been used
    ending_shift_keys = {}
    " end".each_char do |char|
      ending_shift_keys[char] = "A" if ending_index[char] % 4 == 0 
      ending_shift_keys[char] = "B" if ending_index[char] % 4 == 1
      ending_shift_keys[char] = "C" if ending_index[char] % 4 == 2 
      ending_shift_keys[char] = "D" if ending_index[char] % 4 == 3 
    end
    ending_shift_keys
  end

  def determine_shift_key_values
    shift_values = {}

    ending = @ciphertext.chars[-4..1]

    ending.each_with_index do |char, idx|
      # determine index in charset
      char_idx_in_charset = CHARS_SET.index(char)
      # determine index in charset of corresponding char in " end"
      new_char_idx_in_charset = CHARS_SET.index(" end"[idx])
      # determine char_shift_value 
      char_shift_value = new_char_idx_in_charset - char_idx_in_charset

      " end"[idx]
      shift_values["A"] = char_shift_value if ending_shift_keys[" end"[idx]] == "A"
      shift_values["B"] = char_shift_value if ending_shift_keys[" end"[idx]] == "B"
      shift_values["C"] = char_shift_value if ending_shift_keys[" end"[idx]] == "C"
      shift_values["D"] = char_shift_value if ending_shift_keys[" end"[idx]] == "D"
    end
    shift_values
  end

  def determine_key
    determine_shift_key_values.values.join
  end

  
end