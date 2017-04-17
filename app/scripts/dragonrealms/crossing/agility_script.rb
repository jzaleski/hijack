load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_academy_of_agility_script.rb", true

class AgilityScript < OutsideAcademyOfAgilityScript
  protected

  def directions
    super + [
      "go academy|#{OUT}",
    ]
  end

  def location
    "agility|#{CROSSING}"
  end
end
