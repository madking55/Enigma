## Iteration 1 - Enigma Class

# Shift
-generate shifts by adding Keys and Offsets return values
A: 3 (02 + 1)
B: 27 (27 + 0)
C: 73 (71 + 2)
D: 20 (15 + 5)

# Keys
- take given or generate key => "02715"
- generate_keys
  A: random_number[0..1] => 02
  B: random_number[1..2] => 27
  C: random_number[2..3] => 71
  D: ranodm_number[3..4] => 15
- return [02, 27, 71, 15]

# Offsets
- take given or todays date => "040895"
 - square date numeric form => 1672401025
  - take last four digits => 1025
- generate_offsets
  A: four_digits[0]
  B: four_digits[1]
  C: four_digits[2]
  D: four_digits[3]
- return [1, 0, 2, 5]

# Enigma
- #encrypt method
  - input: encrypt(message, key, date)
  - output: hash with three keys:
    :encryption => the encrypted String
    :key => the key used for encryption as a String
    :date => the date used for encryption as a String in the form DDMMYY

# encrypt a message with a key and date
enigma.encrypt("hello world", "02715", "040895")
encrypted = 
          {
          encryption: "keder ohulw",
          key: "02715",
          date: "040895"
          }

# encrypt a message without given date (uses today's date)
encrypted = enigma.encrypt("hello world", "02715")

# encrypt a message without given key and date(generates random key and uses today's date)
encrypted = enigma.encrypt("hello world")
  
- #decrypt method
  - input: decrypt(ciphertext, key, date)
  - output: hash with three keys:
    :decryption => the decrypted String
    :key => the key used for decryption as a String
    :date => the date used for decryption as a String in the form DDMMYY

# decrypt a message with a key and date
enigma.decrypt("keder ohulw", "02715", "040895")
decrypted = 
          {
          decryption: "hello world",
          key: "02715",
          date: "040895"
          }

# decrypt a message with a key (uses today's date)
decrypted = enigma.decrypt(encrypted[:encryption], "02715")

## Iteration 2 - Command Line Interface

## Iteration 3 - Cracking