load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/fire_salamanders_script.rb", true

class CaveGnomesScript < FireSalamandersScript
  protected

  def location
    "cave_gnomes|#{WEHNIMERS_LANDING}"
  end
end
