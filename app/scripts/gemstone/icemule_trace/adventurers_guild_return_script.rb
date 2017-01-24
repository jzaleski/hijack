require_reload 'scripts/gemstone/icemule_trace/adventurers_guild_script'

class AdventurersGuildReturnScript < AdventurersGuildScript
  protected

  def directions
    reverse_directions(super)
  end
end
