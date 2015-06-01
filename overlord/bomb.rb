class Bomb
  attr_accessor :active, :active_code, :deactive_code, :exploded, :wrong_codes

  def initialize
    @active = false
    @active_code = "1234"
    @deactive_code = "0000"
    @exploded = false
    @wrong_codes = 0
  end

  def change_active_code(code)
    @active_code = code
  end

  def change_deactive_code(code)
    @deactive_code = code
  end

  def activate(code)
    @active = true if code == @active_code
  end

  def deactivate(code)
    if code == @deactive_code
      @active = false
    else
      @wrong_codes += 1
      check_for_three_attempts
    end
  end

  def check_for_three_attempts
    explode if @wrong_codes == 3
  end

  def explode
    @exploded = true
  end

  def reset
    @active = false
    @active_code = "1234"
    @deactive_code = "0000"
    @exploded = false
    @wrong_codes = 0
  end
end
