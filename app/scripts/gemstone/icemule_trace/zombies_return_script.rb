require_reload 'scripts/gemstone/icemule_trace/zombies_script'

class ZombiesReturnScript < ZombiesScript
  protected

  def directions
    reverse_directions(super)
  end
end
