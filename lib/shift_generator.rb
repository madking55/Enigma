class ShiftGenerator

  def initialize(key, date)
    @key = key
    @date = date
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
    squared.digits.reverse[-4..-1]
  end

  def generate_shift_values
    shift_values = []
    keys = generate_keys(@key)
    offsets = generate_offsets(@date)
    shift_values[0] = keys[0] + offsets[0]
    shift_values[1] = keys[1] + offsets[1]
    shift_values[2] = keys[2] + offsets[2]
    shift_values[3] = keys[3] + offsets[3]
    shift_values
  end

end