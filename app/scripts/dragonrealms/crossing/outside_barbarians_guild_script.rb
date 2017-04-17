load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_apostle_headquarters_script.rb", true

class OutsideBarbariansGuildScript < OutsideApostleHeadquartersScript
  protected

  def directions
    super + [
      EAST,
      EAST,
    ]
  end

  def location
    "outside_barbarians_guild|#{CROSSING}"
  end
end
