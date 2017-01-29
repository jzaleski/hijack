load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/slimy_little_grubs_script.rb", true

class GremlinsScript < SlimyLittleGrubsScript
  protected

  def location
    "gremlins|#{WEHNIMERS_LANDING}"
  end
end
