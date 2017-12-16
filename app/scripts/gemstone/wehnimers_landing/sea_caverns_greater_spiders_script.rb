load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/sea_caverns_script.rb", true

class SeaCavernsGreaterSpidersScript < SeaCavernsScript
  protected

  def directions
    super + [
      EAST,
      SOUTH,
      WEST,
      SOUTHWEST,
      'go trapdoor',
    ]
  end

  def location
    "sea_caverns_greater_spiders|#{WEHNIMERS_LANDING}"
  end
end
