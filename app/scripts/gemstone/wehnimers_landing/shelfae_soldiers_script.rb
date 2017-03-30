load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/sea_nymphs_script.rb", true

class ShelfaeSoldiersScript < SeaNymphsScript
  protected

  def directions
    super + [
      WEST,
      WEST,
      WEST,
      SOUTHWEST,
      WEST,
      'go path',
      EAST,
      'go crevice',
    ]
  end

  def location
    "shelfae_soldiers|#{WEHNIMERS_LANDING}"
  end
end
