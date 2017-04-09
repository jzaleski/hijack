load "#{SCRIPTS_DIR}/dragonrealms/crossing/outside_alchemist_script.rb", true

class AlchemistSalesroomScript < OutsideAlchemistScript
  protected

  def directions
    super + [
      "go shop|#{OUT}",
    ]
  end

  def location
    "alchemist_salesroom|#{CROSSING}"
  end
end
