load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/spotted_lynx_script.rb", true

class SpottedLynxReturnScript < SpottedLynxScript
  protected

  def directions
    reverse_directions(super)
  end
end
