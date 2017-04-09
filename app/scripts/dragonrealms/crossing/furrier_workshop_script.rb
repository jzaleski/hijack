load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_furrier_script.rb", true

class FurrierWorkshopScript < OutsideFurrierScript
  protected

  def directions
    super + [
      "go shed|#{OUT}"
    ]
  end

  def location
    "furrier_workshop|#{CROSSING}"
  end
end
