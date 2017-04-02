module BrawlingScriptMixin
  private

  def config_starting_maneuver
    @config[:brawl_starting_maneuver]
  end

  def starting_maneuver
    @args[0] || config_starting_maneuver || 'jab'
  end
end
