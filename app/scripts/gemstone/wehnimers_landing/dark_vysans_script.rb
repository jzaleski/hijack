load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/sea_nymphs_script.rb", true

class DarkVysansScript < SeaNymphsScript
  protected

  def directions
    super + [
      SOUTH,
      SOUTHWEST,
      SOUTH,
      EAST,
      SOUTHEAST,
      SOUTHWEST,
      SOUTH,
      SOUTHEAST,
      'go steps',
      SOUTH,
      SOUTHEAST,
      EAST,
      SOUTH,
      SOUTH,
      'go hole',
      'go opening',
    ]
  end

  def location
    "dark_vysans|#{WEHNIMERS_LANDING}"
  end
end
