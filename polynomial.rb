=begin
requirements:
	puts Polynomial.new([-3,-4,1,0,6]) 
   => -3x^4-4x^3+x^2+6
	puts Polynomial.new([1,0,2])  
	  => x^2+2
Details: http://rubylearning.com/blog/2009/11/26/rpcfn-rubyfun-4/
=end

class Polynomial
	def initialize(coefficient)
		@coefficient = coefficient
	end

	def to_s
		exponent = @coefficient.size - 1
		firstposition = false
		@coefficient.each{|i|
			if i != 0 #if a coefficient is 0, nothing gets added to the output
				if i == 1 #if a coefficient is 1, it doesn’t get printed
					if firstposition # don't print + at the first position
						print "+"
					end
				elsif i == -1 #if a coefficient is 1, it doesn’t get printed
					print "-"
				else
					if i < 0 #if a coefficient is negative, you have to display something like “- 2x\^3″, not “+ -2x\^3″
						print "#{i}"
					else
						if firstposition # don't print + at the first position
							print "+"
						end
						print "#{i}"
					end
				end
				if exponent != 0 #x\^0 == 1, so we don’t need to display it
					if exponent != 1 	
						print "x"
					end
					if exponent == 1 #for x\^1 the \^1 part gets omitted
						print "x"
					else
						print "^#{exponent}"				
					end
				end
				firstposition = true
			end
			exponent -= 1
		}
	end
	
	def to_s_new
    coefficient_length = @coefficient.length
    exponent = coefficient_length - 1
    firstposition = true
    result = ""

    @coefficient.each_with_index do |i, index|
      if i == 0 #if a coefficient is 0, nothing gets added to the output
        exponent -= 1
        next
      end

      if i == 1 #if a coefficient is 1, it doesn’t get printed
        result+= "+" unless firstposition # don't print + at the first position
        result+= "#{i}" if (coefficient_length == index + 1)

      elsif i == -1 #if a coefficient is 1, it doesn’t get printed
        result+= "-"
        result+= "#{i}" if (coefficient_length == index + 1)

      else
        if i < 0 #if a coefficient is negative, you have to display something like “- 2x\^3″, not “+ -2x\^3″
          result+= "#{i}"
        else
          result+= "+" unless firstposition # don't print + at the first position
          result+= "#{i}"
        end

      end

      if exponent == 1 #for x\^1 the \^1 part gets omitted
        result+= "x"
      elsif exponent != 0 #x\^0 == 1, so we don’t need to display it
        result+= "x^#{exponent}"
      end

      firstposition = false
      exponent -= 1
    end

    result
  end
end


## For test
data = [
  {
    input: [-3,-4,1,0,6],
    output: "-3x^4-4x^3+x^2+6"
  },
  {
    input: [1,0,2],
    output: "x^2+2"
  },
  {
    input: [-1,-2,3,0],
    output: "-x^3-2x^2+3x"
  },
  {
    input: [0,-4,1,0,6],
    output: "-4x^3+x^2+6"
  },
  {
    input: [0,0,0],
    output: ""
  },
  {
    input: [-3,-4,1,0,1],
    output: "-3x^4-4x^3+x^2+1"
  }
]

data.each_with_index do |test_case, index|
  op = Polynomial.new(test_case[:input]).to_s_new

  puts "------------------ Test case ##{index + 1}"
  puts "Input: #{test_case[:input]}"
  puts "Expected Output: #{test_case[:output]}"
  puts "Real Output: #{op}"
  puts (op == test_case[:output] ? "Passed" : "Failed")
  puts "\n"
end
