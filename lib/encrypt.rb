require './lib/enigma'
require './lib/message_shifter'
require './lib/shift_generator'
require 'date'


enigma = Enigma.new
handle = File.open(ARGV[0], "r")
message_to_encrypt = handle.read
handle.close

encrypted = enigma.encrypt(message_to_encrypt)

writer = File.open(ARGV[1], "w")
writer.write(encrypted[:encryption])
writer.close

p "Created #{ARGV[1]} with the key #{encrypted[:key]} and date #{encrypted[:date]}"
