load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/north_gate_script.rb", true

class WaysideInnScript < NorthGateScript
  protected

  def directions
    super + [
      "go inn|#{OUT}",
    ]
  end

  def location
    "wayside_inn|#{WEHNIMERS_LANDING}"
  end
end
