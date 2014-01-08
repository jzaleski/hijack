require 'scripts/gemstone/icemule_trace/thirsty_penguin_script'

class ThirstyPenguinReturnScript < ThirstyPenguinScript

  protected

  def directions
    reverse_directions(super)
  end

end
