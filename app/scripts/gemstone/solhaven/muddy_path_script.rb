require_reload 'scripts/gemstone/solhaven/rocky_footpath_script'

class MuddyPathScript < RockyFootpathScript
  protected

  def directions
    super + [
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
      WEST,
    ]
  end

  def location
    "muddy_path|#{SOLHAVEN}"
  end
end
