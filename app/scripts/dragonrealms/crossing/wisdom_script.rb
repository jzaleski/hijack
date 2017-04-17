load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_asemath_academy_script.rb", true

class WisdomScript < OutsideAsemathAcademyScript
  protected

  def directions
    super + [
      "go academy|#{OUT}",
      'go memorial arch',
      WEST,
      WEST,
      NORTH,
      "#{NORTH}|#{OUT}",
    ]
  end

  def location
    "wisdom|#{CROSSING}"
  end
end
