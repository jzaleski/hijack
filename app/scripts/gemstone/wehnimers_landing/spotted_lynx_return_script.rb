load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/spotted_lynx_script.rb", true

class SpottedLynxReturnScript < SpottedLynxScript
  protected

  def directions
    reverse_directions(super)
  end
end
