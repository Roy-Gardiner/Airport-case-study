class Weather

	def initialize 

		self.good_to_land= true
		self.good_to_fly= true		
	end

	def good_to_fly= (yesOrNo)
		@good_to_fly = yesOrNo # the Ruby convention is to use snake_case for variables: yes_or_no
	end
	def good_to_fly?
  	@good_to_fly
	end

	def good_to_land= (yesOrNo)
		@good_to_land = yesOrNo
	end
	def good_to_land?
		@good_to_land
	end
	
	def conditions
		good_to_land = rand(1..10) != 10 # this created a local variable that is never used
		good_to_fly = @good_to_land # because this line uses an instance variable
		good_to_fly
	end
end