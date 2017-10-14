load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/manticores_script.rb", true

class ThraksScript < ManticoresScript
  protected

  def location
    "thraks|#{WEHNIMERS_LANDING}"
  end
end
