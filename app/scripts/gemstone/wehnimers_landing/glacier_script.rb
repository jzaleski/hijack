load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/glatoph_script.rb", true

class GlacierScript < GlatophScript
  protected

  def directions
    super + [
      EAST,
      NORTHEAST,
      NORTHEAST,
      "go glacier|#{NORTHEAST}",
    ]
  end

  def location
    "glacier|#{WEHNIMERS_LANDING}"
  end
end
