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

def dagbok_start()
  value = false
  while value != true
    #password_try()
    puts "Do you want to Read or Write?"
    input = gets.chomp
    #Validering 
    if input.downcase == "read"
      #readfunc
    elsif input.downcase == "write"
      #writefunc
    else
      puts "Please enter a valid input"
    end
  end
