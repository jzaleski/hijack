load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_sand_spit_tavern_script.rb", true

class SandSpitTavernBarroomScript < OutsideSandSpitTavernScript
  protected

  def directions
    super + [
      "go tavern|#{OUT}",
    ]
  end

  def location
    "sand_spit_tavern_barroom|#{CROSSING}"
  end
end
