# steps to the algorithm

# - double every second digit starting from the rightmost digit
# - If doubling the number results in a number greater than 9 then subtract 9 from the product
# - then sum all the digits
# - if that sum is divisible by 10 → its a valid number

module Luhn
    def self.valid?(num)
            numarray = num.split("")

            digits = []

            numarray.each do |el| #check if its a number then push it into an array
                if el =~ /\d/ #check if digit
                    digits.push(el)
                elsif el =~ /\D/ && !(el =~ /\s/) #check if not a digit and specifically not a space
                    return false
                end
            end

            return false if digits.length == 1

            digits_rev = digits.reverse

            digits_to_sum = []

            digits_rev.each_with_index do |digit, index|

                    digit_int = digit.to_i

                    if index.odd? && digit_int * 2 < 10 && index !=0 #index % 2 == 1 gives us every second index
                        digits_to_sum.push(digit_int * 2)
                    elsif index.odd? && (digit_int * 2) >= 10 && index !=0
                        digits_to_sum.push(digit_int*2 - 9)
                    else
                        digits_to_sum.push(digit_int)
                    end
            end

            sum = 0
            digits_to_sum.each {|digit| sum += digit}

            sum % 10 == 0 ? true : false
    end
end
