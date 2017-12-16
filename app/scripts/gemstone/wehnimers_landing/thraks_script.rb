load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/large_rockslide_script.rb", true

class ThraksScript < LargeRockslideScript
  protected

  def location
    "thraks|#{WEHNIMERS_LANDING}"
  end
end
