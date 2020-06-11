# [Enigma Project](https://backend.turing.io/module1/projects/enigma/index)


The encryption is based on the Caesar Cipher. The idea is that we can translate a character by shifting it a certain number of places down the alphabet. 

However, instead of using the same shift for every character, our algorithm will use 4 different shifts known as the A, B, C, and D shifts. Every fourth character will be shifted by the same amount, so the 1st, 5th, and 9th characters will be shifted with the A shift, the 2nd, 6th, and 10th characters will be shifted with the B shift, etc.

Additionally, our algorithm will use the standard lowercase alphabet, plus a space, so 27 characters in total. 

## Learning Goals / Areas of Focus

- Practice breaking a program into logical components
- Build classes that demonstrate single responsibilities
- Test drive a well-designed Object Oriented solution
- Work with file i/o

## Iteration 1 (status: done)

### Enigma#encrypt(message, key, date)

The encrypt method takes a message String as an argument. It can optionally take a Key and Date as arguments to use for encryption. If the key is not included, generate a random key. If the date is not included, use today’s date.

The encrypt method returns a hash with three keys:

```
    {
      :encryption => the encrypted String
      :key => the key used for encryption as a String
      :date => the date used for encryption as a String in the form DDMMYY
    }
```

#### encrypt a message with a key and date

```
enigma.encrypt("hello world", "02715", "040895")
encrypted = 
            {
            encryption: "keder ohulw",
            key: "02715",
            date: "040895"
            }
```

#### encrypt a message without given date (uses today's date)

```
encrypted = enigma.encrypt("hello world", "02715")
```

#### encrypt a message without given key and date(generates random key and uses today's date)

```
encrypted = enigma.encrypt("hello world")
```

### Enigma#decrypt(ciphertext, key, date)

In order to decrypt a message, we need to know the key and date that were used for encryption. We can find the total shifts using the same methods as above. Then each character is shifted backwards instead of forwards.

#### decrypt a message with a key and date

```
enigma.decrypt("keder ohulw", "02715", "040895")
decrypted = 
            {
            decryption: "hello world",
            key: "02715",
            date: "040895"
            }
```

#### decrypt a message with a key (uses today's date)

```
decrypted = enigma.decrypt(encrypted[:encryption], "02715")
```

## Finding the Shifts

#### generate_shift_values

Each shift will be the sum of two other shifts known as the Keys and the Offsets. So the A shift will be the A key plus the A offset, the B shift will be the B key plus the B offset, etc.

#### generate_keys

The keys are created by generating a random five digit number, like 02715, and splitting it up like so:

- A key: first two digits (02)
- B key: second and third digits (27)
- C key: third and fourth digits (71)
- D key: fourth and fifth digits (15)

#### generate_offsets

The offsets are found using the date of transmission.

- Consider the date formatted as a number, DDMMYY. If the date is August 4, 1995, it would be represented as 040895.
- Square the numeric form (1672401025)
- Take the last four digits (1025)
- A offset: The first digit (1)
- B offset: The second digit (0)
- C offset: The third digit (2)
- D offset: The fourth digit (5)


## Iteration 2 - Command Line Interface (status: todo)

Add a command line interface for encryption and decryption. You should create a Runner file called encrypt.rb that takes two command line arguments. The first is an existing file that contains a message to encrypt. The second is a file where your program should write the encrypted message. In addition to writing the encrypted message to the file, your program should output to the screen the file it wrote to, the key and the date.

Additionally, you should create a Runner file called decrypt.rb that takes four command line arguments. The first is an existing file that contains an encrypted message. The second is a file where your program should write the decrypted message. The third is the key to be used for decryption. The fourth is the date to be used for decryption. In addition to writing the decrypted message to the file, your program should output to the screen the file it wrote to, the key used for decryption, and the date used for decryption.

You should be able to use your CLI like this:

```
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
Created 'decrypted.txt' with the key 82648 and date 240818
```

## Iteration 3 - Cracking a Key (status: todo)

When the key is not known, we can crack the encryption using just the date of transmission. We believe that each enemy message ends with the characters " end". Use this to crack the encryption.

### Enigma#crack(ciphertext, date)

The crack method decrypts a message without being given the key. This method can optionally take a date to use for cracking as a second argument. If no date is given, it should use today’s date for cracking. It should output a hash containing the decrypted message, the date used for encryption in the form of DDMMYY, and the Key used for encryption.

We believe that each enemy message ends with the characters " end". Use this to crack the encryption.