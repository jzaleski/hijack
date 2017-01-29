load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/helgas_tavern_script.rb", true

class HelgasTavernReturnScript < HelgasTavernScript
  protected

  def directions
    reverse_directions(super)
  end
end
