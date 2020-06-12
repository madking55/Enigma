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

  def determine_shift_key_value
    
    # determine char_idx_in_ciphertext
    ending_idx = {
       " " => @ciphertext.length - 4, 
       "e" => @ciphertext.length - 3, 
       "n" => @ciphertext.length - 2, 
       "d" => @ciphertext.length - 1}

       
    # which shift key has been used
    ending_shift_keys = {}
    " end".each_char do |char|
      ending_shift_keys[char] = "A" if ending_idx[char] % 4 == 0 
      ending_shift_keys[char] = "B" if ending_idx[char] % 4 == 1
      ending_shift_keys[char] = "C" if ending_idx[char] % 4 == 2 
      ending_shift_keys[char] = "D" if ending_idx[char] % 4 == 3 
    end
      
    # determine shift key values  
    shift_values = { "A" => nil, "B" => nil, "C" => nil, "D" => nil }

    ending = @ciphertext.chars[-4..1]

    ending.each_char.with_index do |char, idx|
      # determine index in charset
      char_idx_in_charset = CHARS_SET.index(char)
      # determine index in charset of corresponding char in " end"
      new_char_idx_in_charset = CHARS_SET.index(" end"[idx])
      # determine char_shift_value 
      char_shift_value = new_char_idx_in_charset - char_idx_in_charset

      shift_values["A"] = char_shift_value if ending_shift_keys[" end"[idx]] == "A"
      shift_values["B"] = char_shift_value if ending_shift_keys[" end"[idx]] == "B"
      shift_values["C"] = char_shift_value if ending_shift_keys[" end"[idx]] == "C"
      shift_values["D"] = char_shift_value if ending_shift_keys[" end"[idx]] == "D"
    end

  end

  
end