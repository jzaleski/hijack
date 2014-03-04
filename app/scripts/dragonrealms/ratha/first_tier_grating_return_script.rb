require 'scripts/dragonrealms/ratha/first_tier_grating_script'

class FirstTierGratingReturnScript < FirstTierGratingScript

  protected

  def directions
    reverse_directions(super)
  end

end
