load "#{SCRIPTS_DIR}/gemstone/icemule_trace/thirsty_penguin_script.rb", true

class ThirstyPenguinFrontDeskScript < ThirstyPenguinScript
  protected

  def directions
    super + [
      WEST,
    ]
  end

  def location
    "thirsty_penguin_front_desk|#{ICEMULE_TRACE}"
  end
end
