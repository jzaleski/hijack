load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/abandoned_inn_script.rb", true

class DarkOrcsScript < AbandonedInnScript
  protected

  def directions
    super + [
      'go curtain',
      NORTH,
      EAST,
      'go door',
      'go trapdoor',
      WEST,
      SOUTH,
      "go painting|#{OUT}",
    ]
  end

  def location
    "dark_orcs|#{WEHNIMERS_LANDING}"
  end
end
