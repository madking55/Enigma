class ShiftGenerator
  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
    @shift = []
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

  def generate_shifts
    keys = generate_keys(key)
    offsets = generate_offsets(date)
    @shift[0] = keys[0] + offsets[0]
    @shift[1] = keys[1] + offsets[1]
    @shift[2] = keys[2] + offsets[2]
    @shift[3] = keys[3] + offsets[3]
    @shift
  end

end