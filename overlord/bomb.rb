class Bomb
  attr_accessor :active, :active_code, :deactive_code, :exploded

	def initialize
		@active = false
		@active_code = "1234"
		@deactive_code = "0000"
		@exploded = false
	end

	def set_active_code(code)
		@active_code = code
	end

	def set_deactive_code(code)
		@deactive_code = code
	end

	def activate(code)
		if code == @active_code
			@active = true
		end
		code == @active_code
	end

	def deactivate(code)
		if code == @deactive_code
			@active = false
		end
		code == @deactive_code
	end

	def explode
		@exploded = true
	end 
end
