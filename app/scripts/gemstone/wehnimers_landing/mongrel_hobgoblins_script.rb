load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/spotted_lynx_script.rb", true

class MongrelHobgoblinsScript < SpottedLynxScript
  protected

  def location
    "mongrel_hobgoblins|#{WEHNIMERS_LANDING}"
  end
end
