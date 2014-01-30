require 'scripts/gemstone/wehnimers_landing/rogue_guild_script'

class RogueGuildReturnScript < RogueGuildScript

  protected

  def directions
    reverse_directions(super)
  end

end
