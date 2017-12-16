load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/large_rockslide_script.rb", true

class ManticoresScript < LargeRockslideScript
  protected

  def location
    "manticores|#{WEHNIMERS_LANDING}"
  end
end
