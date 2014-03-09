require 'scripts/dragonrealms/ratha/krriktks_forge_script'

class KrriktksForgeReturnScript < KrriktksForgeScript

  protected

  def directions
    reverse_directions(super)
  end

end
