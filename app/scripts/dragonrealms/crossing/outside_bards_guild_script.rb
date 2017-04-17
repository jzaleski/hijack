load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_apostle_headquarters_script.rb", true

class OutsideBardsGuildScript < OutsideApostleHeadquartersScript
  protected

  def directions
    super + [
      WEST,
      WEST,
      WEST,
    ]
  end

  def location
    "outside_bards_guild|#{CROSSING}"
  end
end
