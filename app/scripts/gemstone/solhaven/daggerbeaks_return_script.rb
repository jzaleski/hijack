require 'scripts/gemstone/solhaven/daggerbeaks_script'

class DaggerbeaksReturnScript < DaggerbeaksScript
  protected

  def directions
    reverse_directions(super)
  end
end
