require 'scripts/gemstone/wehnimers_landing/sea_nymphs_script'

class SeaNymphsReturnScript < SeaNymphsScript
  protected

  def directions
    reverse_directions(super)
  end
end
