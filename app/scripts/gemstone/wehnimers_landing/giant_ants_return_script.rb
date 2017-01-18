require 'scripts/gemstone/wehnimers_landing/giant_ants_script'

class GiantAntsReturnScript < GiantAntsScript
  protected

  def directions
    reverse_directions(super)
  end
end
