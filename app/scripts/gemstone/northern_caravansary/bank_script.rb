load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/green_script.rb", true

class BankScript < GreenScript
  protected

  def directions
    super + [
      NORTHEAST,
      'go steps',
    ]
  end

  def location
    "bank|#{NORTHERN_CARAVANSARY}"
  end
end
