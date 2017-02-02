load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/adventurers_guild_script.rb", true

class AdventurersGuildOfficeScript < AdventurersGuildScript
  protected

  def directions
    super + [
      SOUTHEAST,
    ]
  end

  def location
    "adventurers_guild_office|#{WEHNIMERS_LANDING}"
  end
end
