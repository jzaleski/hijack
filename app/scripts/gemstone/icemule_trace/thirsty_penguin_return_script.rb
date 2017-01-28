load "#{APP_DIR}/scripts/gemstone/icemule_trace/thirsty_penguin_script.rb", true

class ThirstyPenguinReturnScript < ThirstyPenguinScript
  protected

  def directions
    reverse_directions(super)
  end
end
