load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/sea_nymphs_script.rb", true

class GreaterKappasScript < SeaNymphsScript
  protected

  def directions
    super + [
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
      'go path',
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
      WEST,
    ]
  end

  def location
    "greater_kappas|#{WEHNIMERS_LANDING}"
  end
end
