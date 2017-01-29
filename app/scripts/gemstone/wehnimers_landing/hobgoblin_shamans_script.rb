load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/spotted_lynx_script.rb", true

class HobgoblinShamansScript < SpottedLynxScript
  protected

  def location
    "hobgoblin_shamans|#{WEHNIMERS_LANDING}"
  end
end
