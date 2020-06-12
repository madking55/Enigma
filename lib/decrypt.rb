require './lib/enigma'
require './lib/message_shifter'
require './lib/shift_generator'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")
message_to_decrypt = handle.read
handle.close

decrypted = enigma.decrypt(message_to_decrypt, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")
writer.write(decrypted[:decryption])
writer.close

p "Created #{ARGV[1]} with the key #{decrypted[:key]} and date #{decrypted[:date]}"
