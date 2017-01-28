load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/fire_salamanders_script.rb", true

class FireSalamandersReturnScript < FireSalamandersScript
  protected

  def directions
    reverse_directions(super)
  end
end
