load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/north_gate_script.rb", true

class GratkorsCartScript < NorthGateScript
  protected

  def directions
    super + [
      NORTH,
      'go clearing|go path',
    ]
  end

  def location
    "gratkors_cart|#{WEHNIMERS_LANDING}"
  end
end
