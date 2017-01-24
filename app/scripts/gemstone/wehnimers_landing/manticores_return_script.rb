require_reload 'scripts/gemstone/wehnimers_landing/manticores_script'

class ManticoresReturnScript < ManticoresScript
  protected

  def directions
    reverse_directions(super)
  end
end
