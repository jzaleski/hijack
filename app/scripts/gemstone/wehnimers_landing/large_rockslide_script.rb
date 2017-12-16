load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/wooden_signpost_script.rb", true

class LargeRockslideScript < WoodenSignpostScript
  protected

  def directions
    super + [
      NORTHEAST,
      NORTH,
      'go rockslide',
    ]
  end

  def location
    "large_rockslide|#{WEHNIMERS_LANDING}"
  end
end
