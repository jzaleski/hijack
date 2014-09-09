require 'scripts/gemstone/solhaven/manticores_script'

class ManticoresReturnScript < ManticoresScript
  protected

  def directions
    reverse_directions(super)
  end
end
