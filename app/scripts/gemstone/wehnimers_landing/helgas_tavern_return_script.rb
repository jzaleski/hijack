load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/helgas_tavern_script.rb", true

class HelgasTavernReturnScript < HelgasTavernScript
  protected

  def directions
    reverse_directions(super)
  end
end
