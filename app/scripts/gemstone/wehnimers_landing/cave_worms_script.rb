load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/sea_caverns_greater_spiders_script.rb", true

class CaveWormsScript < SeaCavernsGreaterSpidersScript
  protected

  def location
    "cave_worms|#{WEHNIMERS_LANDING}"
  end
end
