load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_furrier_script.rb", true

class DisciplineScript < OutsideFurrierScript
  protected

  def directions
    super + [
      EAST,
      NORTH,
      NORTH,
      "go hovel|#{OUT}",
    ]
  end

  def location
    "discipline|#{CROSSING}"
  end
end
