require 'scripts/gemstone/wehnimers_landing/rats_script'

class RatsReturnScript < RatsScript
  protected

  def directions
    reverse_directions(super)
  end
end
