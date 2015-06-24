cat = Array.new(100, true)
i=j=0
while i < 100
	while j < 100
		cat[j] = !cat[j]
		j+=i+1
	end
	j=i+=1
end
cat.each do |hat|	
	puts "Cat number #{i-99} does not have a hat on!" unless hat
	i+=1	
end