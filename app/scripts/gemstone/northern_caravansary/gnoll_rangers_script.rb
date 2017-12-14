load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/gnoll_thieves_script.rb", true

class GnollRangersScript < GnollThievesScript
  protected

  def location
    "gnoll_rangers|#{NORTHERN_CARAVANSARY}"
  end
end
