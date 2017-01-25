require 'scripts/gemstone/wehnimers_landing/glacier_script'

class GlacierReturnScript < GlacierScript
  protected

  def directions
    reverse_directions(super)
  end
end
