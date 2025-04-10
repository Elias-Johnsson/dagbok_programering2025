
def password_try()
  correct_password = File.read("password.txt")
  value = false
    while value == false
        puts "Enter password please: "
        #validering
        password_try = gets.chomp()
        if password_try == correct_password
            puts "Correct password!"
            #dekrypt_files()
            value = true
        else
            puts "incorrect password, try again"
        end
    end
end


def readfunc()
  puts "what date do you want to read(YY_MM_DD)?"
  date = gets.chomp() + ".txt"
  Dir.chdir("entries")
  open_date = File.read(date)
  puts " "
  puts "_______________________________________________________________________"
  puts " "
  puts open_date
  puts " "
  puts "_______________________________________________________________________"
  puts " "
  valueread = false 
  while valueread != true 
    puts "do you want to log out or read another date?"
    input = gets.chomp.strip()
    if input == "logout"
      valueread = true 
    elsif input == "read"
      valueread = true
    else 
      puts "Input must be an alternativ"
    end
  end
  Dir.chdir("../")
  if input == "read"
    readfunc()
  end
end


def writefunc()
  puts "Input todays date(YY_MM_DD): "
  name = gets.chomp + ".txt"
  puts " "
  puts "_______________________________________________________________________"
  puts " "
  Dir.chdir("entries")
  file = File.open(name,"w")
  puts "File is in write mode, click 'enter' to submit line, type '/end' to stop writing"
  writing = true
  puts "Type the entry: "
  puts " "
  while writing
    text_line = gets.chomp
    if text_line == "/end"
      writing = false
      file.close
      puts " "
      puts "_______________________________________________________________________"
      puts " "
      puts "Writing mode has ended"
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
    #password_try()
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
  end
end

main()


