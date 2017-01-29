load "#{SCRIPTS_DIR}/gemstone/solhaven/rocky_footpath_script.rb", true

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
