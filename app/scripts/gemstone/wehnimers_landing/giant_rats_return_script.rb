require 'scripts/gemstone/wehnimers_landing/giant_rats_script'

class GiantRatsReturnScript < GiantRatsScript
  protected

  def directions
    reverse_directions(super)
  end
end
