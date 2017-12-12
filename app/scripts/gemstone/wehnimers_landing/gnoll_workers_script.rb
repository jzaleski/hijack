load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/upper_trollfang_stone_bridge_script.rb", true

class GnollWorkersScript < UpperTrollfangStoneBridgeScript
  protected

  def directions
    super + [
      SOUTHEAST,
      SOUTH,
      SOUTHEAST,
      SOUTH,
      EAST,
    ]
  end

  def location
    "gnoll_workers|#{WEHNIMERS_LANDING}"
  end
end
