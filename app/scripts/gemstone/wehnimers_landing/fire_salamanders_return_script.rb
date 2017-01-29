load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/fire_salamanders_script.rb", true

class FireSalamandersReturnScript < FireSalamandersScript
  protected

  def directions
    reverse_directions(super)
  end
end
