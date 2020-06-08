class Enigma

 def todays_date
  Date.today.strftime("%d/%m/%Y")
 end

 def generate_key
  rand(9999).to_s.rjust(5, "0")
 end
end