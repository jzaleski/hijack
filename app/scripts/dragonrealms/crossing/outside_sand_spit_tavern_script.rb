load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_ship_rats_script.rb", true

class OutsideSandSpitTavernScript < OutsideShipRatsScript
  protected

  def directions
    super + [
      WEST,
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
      SOUTH,
      NORTHWEST,
    ]
  end

  def location
    "outside_sand_spit_tavern|#{CROSSING}"
  end
end
