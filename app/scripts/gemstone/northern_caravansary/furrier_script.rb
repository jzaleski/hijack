load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class FurrierScript < GreenScript
  protected

  def directions
    super + [
      SOUTHWEST,
      "go steps|#{OUT}",
    ]
  end

  def location
    "furrier|#{NORTHERN_CARAVANSARY}"
  end
end
