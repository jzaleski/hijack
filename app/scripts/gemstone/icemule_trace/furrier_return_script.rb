require_reload 'scripts/gemstone/icemule_trace/furrier_script'

class FurrierReturnScript < FurrierScript
  protected

  def directions
    reverse_directions(super)
  end
end
