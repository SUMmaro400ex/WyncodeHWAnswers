#add_two_to_who.rb
# Add 2 to the number.
def add_two(number)
  if number.respond_to? :+
    if number.respond_to? :push
    	number.push 2
    elsif number.respond_to? :upcase
    	if number.to_i.to_s == number
    		number.to_i + 2
    	else
    		nil
    	end
    else
      number + 2
    end
  end
end

def test_add_two
    p add_two(1) == 3
    p add_two(1.0) == 3.0
    p add_two(nil).nil?
    p add_two({}).nil?
    p add_two([]) == [2]
    p add_two(false).nil?
    p add_two("2") == 4
    p add_two("bananas").nil?
end

test_add_two
