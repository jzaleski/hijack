load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/skeletal_lords_script.rb", true

class SkeletalWarhorsesScript < SkeletalLordsScript
  protected

  def directions
    super + [
      NORTH,
      WEST,
      "go doors|#{OUT}",
    ]
  end

  def location
    "skeletal_warhorses|#{WEHNIMERS_LANDING}"
  end
end
