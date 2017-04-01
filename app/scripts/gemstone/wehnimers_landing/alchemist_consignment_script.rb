load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/alchemist_script.rb", true

class AlchemistConsignmentScript < AlchemistScript
  protected

  def directions
    super + [
      EAST,
    ]
  end

  def location
    "alchemist_consignment|#{WEHNIMERS_LANDING}"
  end
end
