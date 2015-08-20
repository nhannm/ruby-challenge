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
end
