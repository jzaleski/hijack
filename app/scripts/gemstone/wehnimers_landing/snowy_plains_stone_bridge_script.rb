load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/deep_chasm_script.rb", true

class SnowyPlainsStoneBridgeScript < DeepChasmScript
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
    "snowy_plains_stone_bridge|#{WEHNIMERS_LANDING}"
  end
end
