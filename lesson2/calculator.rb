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

puts "Welcome to the calulator!"
puts "what's the first number?"
number1 = gets.chomp.to_i
puts "what the second number?"
number2 = gets.chomp.to_i
puts "what operation would ou like to perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == '1'
  result = number1 + number2
elsif operator == '2'
  result = number1 - number2
elsif operator == '3'
  result = number1 * number2
elsif operator == '4'
  result = number1.to_f / number2.to_f
end

puts "result is #{result}"
