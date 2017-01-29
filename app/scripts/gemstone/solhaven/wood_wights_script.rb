load "#{SCRIPTS_DIR}/gemstone/solhaven/rocky_footpath_script.rb", true

class WoodWightsScript < RockyFootpathScript
  protected

  def directions
    super + [
      'climb footpath',
    ]
  end

  def location
    "wood_wights|#{SOLHAVEN}"
  end
end
