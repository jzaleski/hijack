load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/gremlins_script.rb", true

class GremlinsReturnScript < GremlinsScript
  protected

  def directions
    reverse_directions(super)
  end
end
