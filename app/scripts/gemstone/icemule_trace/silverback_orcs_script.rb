load "#{SCRIPTS_DIR}/gemstone/icemule_trace/east_gate_script.rb", true

class SilverbackOrcsScript < EastGateScript
  protected

  def directions
    super + [
      EAST,
      NORTHEAST,
      "climb trail|#{UP}",
      UP,
      UP,
    ]
  end

  def location
    "silverback_orcs|#{ICEMULE_TRACE}"
  end
end
