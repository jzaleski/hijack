load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/mine_greater_spiders_script.rb", true

class CrystalGolemsScript < MineGreaterSpidersScript
  protected

  def directions
    super + [
      NORTHWEST,
      WEST,
      'go fissure',
    ]
  end

  def location
    "crystal_golems|#{WEHNIMERS_LANDING}"
  end
end
