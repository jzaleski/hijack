require 'scripts/gemstone/wehnimers_landing/temple_script'

class TempleReturnScript < TempleScript

  protected

  def directions
    reverse_directions(super)
  end

end
