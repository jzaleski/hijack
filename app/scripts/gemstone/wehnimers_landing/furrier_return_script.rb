require 'scripts/gemstone/wehnimers_landing/furrier_script'

class FurrierReturnScript < FurrierScript

  protected

  def directions
    reverse_directions(super)
  end

end
