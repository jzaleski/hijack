require_reload 'scripts/gemstone/wehnimers_landing/deep_chasm_script'

class StoneBridgeScript < DeepChasmScript
  protected

  def directions
    super + [
      "go chasm|#{DOWN}",
      DOWN,
      EAST,
      DOWN,
      NORTH,
      NORTH,
      NORTHEAST,
      NORTH,
      NORTH,
      NORTH,
      NORTHEAST,
      NORTHEAST,
      NORTHEAST,
      NORTH,
      NORTH,
      NORTHEAST,
      NORTH,
      NORTHEAST,
      NORTH,
    ]
  end

  def location
    "stone_bridge|#{WEHNIMERS_LANDING}"
  end
end
