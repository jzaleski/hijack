require_reload 'scripts/gemstone/solhaven/rocky_footpath_script'

class RockyFootpathReturnScript < RockyFootpathScript
  protected

  def directions
    reverse_directions(super)
  end
end
