load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/cave_gnolls_script.rb", true

class TroglodytesScript < CaveGnollsScript
  protected

  def location
    "troglodytes|#{WEHNIMERS_LANDING}"
  end
end
