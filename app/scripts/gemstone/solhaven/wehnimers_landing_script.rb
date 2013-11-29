require 'scripts/gemstone/wehnimers_landing/solhaven_script'

class WehnimersLandingScript < SolhavenScript

  protected

  def directions
    reverse_directions(super)
  end

end
