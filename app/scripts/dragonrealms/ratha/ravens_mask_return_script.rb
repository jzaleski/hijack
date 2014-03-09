require 'scripts/dragonrealms/ratha/ravens_mask_script'

class RavensMaskReturnScript < RavensMaskScript

  protected

  def directions
    reverse_directions(super)
  end

end
