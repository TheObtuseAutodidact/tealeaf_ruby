# Assignment: Mortgage / Car Loan Calculator
#
# Take everything you've learned so far and build a mortgage calculator (or car payment calculator -- it's the same thing).
#
# You'll need three pieces of information:
#
# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration
# From the above, you'll need to calculate the following two things:
#
# monthly interest rate
# loan duration in months
# You can then use the formula described here: http://www.mtgprofessor.com/formulas.htm
#
# Finally, don't forget to run your code through Rubocop.
#
# Hints:
#
# Figure out what format your inputs need to be in. For example, should the interest rate be expressed as 5 or .05, if you mean 5% interest?
# If you're working with Annual Percentage Rate (APR), you'll need to convert that to a monthly interest rate.
# Be careful about the loan duration -- are you working with months or years? Choose variable names carefully to assist in remembering.

def int_validate(num)
  num.is_a?(Integer) && num.to_i > 0
end

puts "Welcome to the loan calculator."

answer = "y"

loop do # main loop
  # gathering principle
  puts "\nPlease enter the amount of your loan: (no commas, no decimal values and > than 0)"
  principle = gets.chomp.to_i

  loop do
    if int_validate(principle)
      puts "You entered a loan amount of $#{principle}.\n"
      break
    else
      puts "Hmm... something's not right"
      puts "please enter the amount of your loan: (no commas, no decimal values and > than 0)"
      principle = gets.chomp.to_i
    end
  end

  # gathering interest rate
  puts "\nOK, now enter your interest rate: (as a positive int\n fill in the blank: My interest rate is __ %)"
  rate = gets.chomp.to_i

  loop do
    if int_validate(rate)
      puts "You entered an intrest rate of #{rate}%\n"
      break
    else
      puts "No, something's not right there. Please try again with your interest rate formatted as requested above."
      rate = gets.chomp.to_i
    end
  end

  # gathering loan duration
  puts "\nOK, lastly, we need your loan duration: (number of years, again, entered as a positive int, greater than 0)"
  loan_duration = gets.chomp.to_i

  loop do
    if int_validate(loan_duration)
      puts "You entered a loan duration of #{loan_duration} years."
      break
    else
      puts "No, try again."
      loan_duration = gets.chomp.to_i
    end
  end
  # "Based on the following formula:"
  # "P = L[c(1 + c)^n]/[(1 + c)^n - 1]"
  # L = principle
  # c = APR/100/12
  # n = number of months
  months = loan_duration * 12 # n
  monthly_rate = (rate / 100.0) / 12 # c
  monthly_payment = principle * (monthly_rate * (1 + monthly_rate)**months) / ((1 + monthly_rate)**months - 1) # P
  puts "The priciple loan amount is $#{principle}."
  puts "An APR of #{rate}% broken down monthly is #{monthly_rate}."
  puts "Your monthly payments would be $#{monthly_payment.round(2)} over #{loan_duration} years or #{months} months"

  puts "\nWould you like to calculate another loan? ( 'y' to continue calculating)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

puts "Thanks for using loan_calc!"
