load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/dark_orcs_script.rb", true

class GiantMarmotsScript < DarkOrcsScript
  protected

  def location
    "giant_marmots|#{WEHNIMERS_LANDING}"
  end
end
