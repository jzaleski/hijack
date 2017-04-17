load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_apostle_headquarters_script.rb", true

class OutsideAsemathAcademyScript < OutsideApostleHeadquartersScript
  protected

  def directions
    super + [
      WEST,
      SOUTH,
      SOUTH,
    ]
  end

  def location
    "outside_asemath_academy|#{CROSSING}"
  end
end
