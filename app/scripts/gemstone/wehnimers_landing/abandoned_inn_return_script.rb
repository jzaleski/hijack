require 'scripts/gemstone/wehnimers_landing/abandoned_inn_script'

class AbandonedInnReturnScript < AbandonedInnScript

  protected

  def directions
    reverse_directions(super)
  end

end
