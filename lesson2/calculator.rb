# Build a command line calculator program that does the following:
#
# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiple or divide
# displays the result
# Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display output. Remember that Kernel.gets() includes the newline, so you have to call chomp() to remove it: Kernel.gets().chomp().
#
# Let's take a first stab at it. Watch the video below and type along in a .rb file.


###### before vid
# puts "Enter first number: "
# num1 = gets.chomp.to_f
# puts "Enter second number: "
# num2 = gets.chomp.to_f
# puts "Enter operation to be performed (add, subtract, multiply, or divide): "
# operator = gets.chomp
#
# case operator
# when "add"
#   puts num1 + num2
# when "subtract"
#   puts num1 - num2
# when "multiply"
#   puts num1 * num2
# when "divide"
#   puts num1 / num2
# else
#   puts "unrecognized operator"
# end
#

###  pseudo code
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multipying"
  when '4'
    "Dividing"
  end
end

prompt("Welcome to the calulator! Enter your name: ")
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt("make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do #main loop

  number1 = ''
  loop do
  prompt("what's the first number?")
  number1 = gets.chomp.to_i

  if valid_number?(number1)
    break
  else
    prompt("Hmm... that doesn't look like a valid number.")
  end
  end

  number2 = ''
  loop do
  prompt("what the second number?")
  number2 = gets.chomp.to_i

  if valid_number?(number2)
    break
  else
    prompt("Hmm... that doesn't look like a valid number.")
  end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  # if operator == '1'
  #   result = number1 + number2
  # elsif operator == '2'
  #   result = number1 - number2
  # elsif operator == '3'
  #   result = number1 * number2
  # elsif operator == '4'
  #   result = number1.to_f / number2.to_f
  # end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
  when '1'
  number1 + number2
  when '2'
  number1 - number2
  when '3'
  number1 * number2
  when '4'
  number1.to_f / number2.to_f
  end

  prompt("result is #{result}")

  prompt("Do you want to perform another calculation?(Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

end

prompt("Thank you for using the calculator. Good bye")
