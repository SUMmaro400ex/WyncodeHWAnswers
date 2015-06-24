#realityTV.rb

class Game
	attr_accessor :tribes

	def initialize
		@tribes = []
	end

	def add_tribe(tribe)
		@tribes << tribe
	end

	def immunity_challenge
		losing_tribe = @tribes.sample
		puts "First immunity challenge loser is #{losing_tribe}"
		puts "#{losing_tribe} must got to tribal council."
		losing_tribe
	end

	def merge(tribe_name)
		remaining_castaways = []
		@tribes.each do |tribe|
			remaining_castaways << tribe.members
		end
		remaining_castaways.flatten!
		new_tribe = Tribe.new(tribe_name)
		new_tribe.members = remaining_castaways
		@tribes = []
		add_tribe(new_tribe)
	end

end

class Tribe
	attr_accessor :name, :members
	
	def inspect
		@name
	end

	def initialize(name)
		@name=name
		@members = []
	end

	def to_s
		@name
	end

	def go_to_tribal_council
		voted_off = @members.sample
		puts "#{voted_off} was voted off the island."
		@members.delete(voted_off)
		puts "Remaining tribe mates are: #{@members}"
	end

end


class Castaway
	attr_accessor :name
	def initialize(name)
		@name=name
	end

	def inspect
		@name
	end

	def to_s
		@name
	end
end



def test
	survivor=Game.new
	tribe1=Tribe.new("Ukelele")
	tribe2=Tribe.new("Austonbunsen")

	# puts tribe1.name
	# puts tribe2.name

	survivor.add_tribe(tribe1)
	survivor.add_tribe(tribe2)

	# p survivor.tribes

	castaways = %w{walter ed gabe dieago juliana jo juha sofia ben lenora weston dena zach jon seanh seans david ari anthony jonsnow}
	castaways.map! do |castaway|
		Castaway.new(castaway)
	end

	castaways.shuffle!
	p castaways
	p survivor.tribes.first.members = castaways.shift(10)
	p survivor.tribes.last.members = castaways.shift(10)
	p survivor.tribes
	p tribe1.members

	8.times do
		losing_tribe = survivor.immunity_challenge
		losing_tribe.go_to_tribal_council
	end

	survivor.merge("Cello")

	puts survivor.tribes
	puts survivor.tribes.first.members

end

test