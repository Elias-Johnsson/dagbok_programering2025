def password_try()
  value = false
  # kunna avsluta program
    while value == false
        puts "Enter password please or quit: "
        password_try = gets.chomp()
        if password_try.downcase == "quit"
          value = true
          return false
        else
          dekryptering("password.txt")
          Dir.chdir("entries")
          correct_password = (File.read("password.txt")).chomp
          Dir.chdir("../")
          if password_try == correct_password
            puts "Correct password!"
            value = true
            kryptering("password.txt")
            return true
          else
            puts "incorrect password, try again"
          end
          kryptering("password.txt")
        end
      end
end

def kryptering(str)
  alpha_cap = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "Å", "Ä", "Ö"]
  alpha_lower = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "å", "ä", "ö"]
  output = ""
  num_arr = ["0","1","2","3","4","5","6","7","8","9"]
  Dir.chdir("entries")
  file_text = File.read(str)
  i = 0
  while i < file_text.length
    if file_text[i] == "." || file_text[i] == "," ||file_text[i] == "-"|| file_text[i] == ":" || file_text[i] == ";" || file_text[i] == " " || file_text[i] == "\n" || file_text[i] == "_" || file_text[i] == "-"
      output << file_text[i]
    end
    u = 0
    while u < num_arr.length
      if file_text[i] == num_arr[u]
        output << num_arr[u - 5]
      end
      u += 1
    end
    if file_text[i].upcase
      n = 0
      while n < alpha_cap.length
        if file_text[i] == alpha_cap[n]
          output << alpha_cap[n - 5]
        end
        n += 1
      end
    end
    if file_text[i].downcase
      j = 0
      while j < alpha_lower.length
        if file_text[i] == alpha_lower[j]
          output << alpha_lower[j - 5]
        end
        j += 1
      end
    end
      i += 1
  end
  File.open(str, "w") {}
  fil = File.open(str, "w")
  fil.puts output
  fil.close
  Dir.chdir("../")
end

def dekryptering(str)
  alpha_cap = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "Å", "Ä", "Ö"]
  alpha_lower = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "å", "ä", "ö"]
  output = ""
  num_arr = ["0","1","2","3","4","5","6","7","8","9"]
  Dir.chdir("entries")
  file_text = File.read(str)
  i = 0
  while i < file_text.length
    if file_text[i] == "." || file_text[i] == "," ||file_text[i] == "-"|| file_text[i] == ":" || file_text[i] == " " || file_text[i] == "\n" || file_text[i] == "_" || file_text[i] == "-"
      output << file_text[i]
    end
    u = 0
    while u < num_arr.length
      if file_text[i] == num_arr[u]
        output << num_arr[u - (num_arr.length - 5)]
      end
      u += 1
    end
    if file_text[i].upcase
      n = 0
      while n < alpha_cap.length
        if file_text[i] == alpha_cap[n]
          output << alpha_cap[n - (alpha_cap.length - 5)]
        end
        n += 1
      end
    end
    if file_text[i].downcase
      j = 0
      while j < alpha_lower.length
        if file_text[i] == alpha_lower[j]
          output << alpha_lower[j - (alpha_lower.length - 5)]
        end
        j += 1
      end
    end
    i += 1
  end
  File.open(str, "w") {}
  fil = File.open(str, "w")
  fil.puts output
  fil.close
  Dir.chdir("../")
end

def readfunc()
  puts "what date do you want to read(YY_MM_DD)?"
  date = gets.chomp() + ".txt"
  dekryptering(date)
  Dir.chdir("entries")
  open_date = (File.read(date)).chomp
  puts " "
  puts "_______________________________________________________________________"
  puts " "
  puts open_date
  puts " "
  puts "_______________________________________________________________________"
  puts " "
  valueread = false 
  Dir.chdir("../")
  kryptering(date)
  while valueread != true 
    puts "do you want to exit or read another date?"
    input = gets.chomp.strip()
    if input == "exit"
      valueread = true 
    elsif input == "read"
      valueread = true
    else 
      puts "Input must be an alternativ"
    end
  end
  if input == "read"
    readfunc()
  end
end

def writefunc()
  puts "Input todays date(YY_MM_DD): "
  header = gets
  name = header.chomp + ".txt"
  puts " "
  puts "_______________________________________________________________________"
  puts " "
  Dir.chdir("entries")
  file = File.open(name,"w")
  file.puts(header)
  file.puts("\n")
  puts "File is in write mode, click 'enter' to submit line, type '/end' to stop writing"
  writing = true
  puts "Type the entry: "
  puts 
  while writing
    text_line = gets.chomp
    if text_line == "/end"
      writing = false
      file.close
      puts " "
      puts "_______________________________________________________________________"
      puts " "
      puts "Writing mode has ended"
      Dir.chdir("../")
      kryptering(name)
      Dir.chdir("entries")
    else
      file.puts(text_line)
    end
  end
  Dir.chdir("../")
end

def main()
  value = true
  condition = true
  while condition
    if password_try()
      while value != false
        puts "Do you want to Read,Write or logout?"
        input = gets.chomp
        #Validering 
        if input.downcase == "read"
          readfunc()
        elsif input.downcase == "write"
          writefunc()
        elsif input.downcase == "logout"
          value = false
        else
          puts "Input must be an alternativ"
        end
      end
    else
      condition = false
    end
  end
end

def test()
  #kryptering("password.txt")
  #dekryptering("password")
  #password_try()
end

#test()

main()



