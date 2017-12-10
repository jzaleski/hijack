load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class GemshopScript < GreenScript
  protected

  def directions
    super + [
      NORTHWEST,
      'go steps',
    ]
  end

  def location
    "gemshop|#{NORTHERN_CARAVANSARY}"
  end
end
