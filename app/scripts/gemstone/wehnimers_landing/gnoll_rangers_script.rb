load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/gnoll_thieves_script.rb", true

class GnollRangersScript < GnollThievesScript
  protected

  def location
    "gnoll_rangers|#{WEHNIMERS_LANDING}"
  end
end
