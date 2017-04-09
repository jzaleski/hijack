load "#{SCRIPTS_DIR}/dragonrealms/crossing/town_hall_script.rb", true

class TownHallDebtorsOfficeScript < TownHallScript
  protected

  def directions
    super + [
      "go collection office|#{OUT}",
    ]
  end

  def location
    "town_hall_debtors_office|#{CROSSING}"
  end
end
