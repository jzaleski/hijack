load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/greater_spiders_script.rb", true

class CrystalGolemsScript < GreaterSpidersScript
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
