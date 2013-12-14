require 'scripts/gemstone/solhaven/adventurers_guild_script'

class AdventurersGuildReturnScript < AdventurersGuildScript

  protected

  def directions
    reverse_directions(super)
  end

end
