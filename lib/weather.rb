class Weather

	def initiallize 
		@good_to_fly = true
	end

	def good_to_fly= (yesOrNo)
		@good_to_fly = yesOrNo
	end

	def good_to_fly?

#		rand(1..10) != 10 
		@good_to_fly
	end

end