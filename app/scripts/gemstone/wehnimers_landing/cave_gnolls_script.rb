load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/hobgoblins_script.rb", true

class CaveGnollsScript < HobgoblinsScript
  protected

  def directions
    super + [
      SOUTH,
      SOUTH,
      SOUTHWEST,
      SOUTHEAST,
      SOUTH,
      SOUTH,
      'go trail',
      SOUTHWEST,
      SOUTHWEST,
      'go opening',
    ]
  end

  def location
    "cave_gnolls|#{WEHNIMERS_LANDING}"
  end
end
