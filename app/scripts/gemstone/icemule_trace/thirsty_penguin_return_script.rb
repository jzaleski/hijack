load "#{SCRIPTS_DIR}/gemstone/icemule_trace/thirsty_penguin_script.rb", true

class ThirstyPenguinReturnScript < ThirstyPenguinScript
  protected

  def directions
    reverse_directions(super)
  end
end
